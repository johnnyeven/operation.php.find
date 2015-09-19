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


class GitDiffFile
{
    const ACTION_CHANGE = 1;
    const ACTION_NEW = 2;
    const ACTION_DELETE = 3;

    function __construct($file_lines) {
        $this->diff_lines = $file_lines;
        $this->header = $this->diff_lines[0];
        $this->file_name = $this->get_file_name();
        $this->meta = $this->diff_lines[1];
        $this->sections = $this->get_sections();
        $this->action = null;

        if (stripos($this->meta, 'index') === 0) {
            $this->action = 1;
        }

        if (stripos($this->meta, 'deleted file') === 0) {
            $this->action = 2;
        }

        if (stripos($this->meta, 'new file') === 0) {
            $this->action = 3;
        }

    }

    public function get_action() {
        return $this->action;
    }

    private function get_file_name() {
        preg_match("#.*b/(.*)$#i", $this->header, $matches);
        return $matches[1];
    }

    private function get_sections() {
        $capture = false;
        $buffer = array();
        $sections = array();
        foreach ($this->diff_lines as $line) {
            if (stripos($line, '@@') === 0) {
                $capture = true;
                if (!empty($buffer)) {
                    $sections[] = $buffer;
                    $buffer = array();
                }
            }
            if ($capture) {
                $buffer[] = $line;
            }
        }

        $sections[] = $buffer;
        $obj_sections = array();

        foreach($sections as $section) {
            if (count($section) == 0) { continue; }
            $obj_sections[] = new GitDiffSection($section);
        }

        return $obj_sections;

    }
}