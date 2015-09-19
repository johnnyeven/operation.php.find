<?php
/**
 * Link Platform
 *
 * PHP Version 5.4
 *
 * @category  Foundation
 * @author    johnnyeven <liyiwen@huoyunren.com>
 * @copyright 2015 Chinaway ltd.
 * @version   Alpha: ${Id}
 * @link
 */

namespace Models;


class GitDiffSection
{

    private $header_pattern = "/@@ -(\d+)(?:,(\d+)|) \+(\d+)(?:,(\d+)|) @@(.*)/i";
    private $diff_lines;

    function __construct($section_lines)
    {
        $this->diff_lines = $section_lines;
        $this->header = $this->diff_lines[0];
        list ($this->left_line_offset, $this->left_line_count, $this->right_line_offset, $this->right_line_count) = $this->get_metrics();

        $this->lines = $this->get_lines();
    }

    private function get_metrics()
    {
        preg_match($this->header_pattern, $this->header, $matches);
        array_shift($matches);
        // Some of our matches might be empty strings, this makes them the
        // correct default values according to http://en.wikipedia.org/wiki/Diff#Unified_format
        $res = array_map(function ($v) {
            if ($v === '') {
                return 1;
            }
            return intval($v);
        }, $matches);
        return $res;
    }

    private function get_lines()
    {
        $lines = $this->diff_lines;
        // Remove the metrics line
        array_shift($lines);

        $obj_lines = array();

        $left_line_num = $this->left_line_offset;
        $right_line_num = $this->right_line_offset;

        foreach ($lines as $line) {

            $m = $this->line_mode($line);
            $l = null;
            $r = null;

            if ($m == 0) {
                $l = $left_line_num++;
                $r = $right_line_num++;
            }

            if ($m == -1) {
                $l = $left_line_num++;
            }

            if ($m == 1) {
                $r = $right_line_num++;
            }

            if ($m == 9) {
                // Don't change any line counts
            }

            $ol = new GitDiffLine($line, $l, $r, $m);

            $obj_lines[] = $ol;
        }

        return $obj_lines;
    }

    private function line_mode($line)
    {
        if (strlen($line) === 0) {
            return 0;
        }
        $s = $line[0];
        // This line does not appear on the left side of the diff, but does appear on the right, line addition
        if ($s === '+') {
            return 1;
        }

        // This line appears on the left side of the diff, and not the right, line removal
        if ($s == '-') {
            return -1;
        }

        // This line appears on both sides of the diff no line change
        if ($s == ' ') {
            return 0;
        }

        // This line is a note appears as a note, doesnt effect line count
        if ($s == '\\') {
            return 9;
        }
    }

}