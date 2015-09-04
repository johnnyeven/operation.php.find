<?php
// lib/Gitter/Util/DateTime.php

/*
 * This file is part of the Gitter library.
 *
 * (c) Klaus Silveira <klaussilveira@php.net>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Models;

/**
 * Fixes the issue that the $timezone parameter and the current timezone are ignored when
 * the $time parameter either is a UNIX timestamp (e.g. @946684800) or specifies a timezone
 * (e.g. 2010-01-28T15:00:00+02:00).
 *
 * @link https://github.com/klaussilveira/gitlist/issues/140
 */
class DateTime extends \DateTime
{
    /**
     * @const The regular expression for an UNIX timestamp
     */
    const UNIX_TIMESTAMP_PATTERN = '/^@\d+$/';

    /**
     * @param string       $time     A date/time string.
     * @param DateTimeZone $timezone A DateTimeZone object representing the desired time zone.
     * @return DateTime A new DateTime instance.
     * @link http://php.net/manual/en/datetime.construct.php
     */
    public function __construct($time = 'now', \DateTimeZone $timezone = null)
    {
        if ($timezone) {
            parent::__construct($time, $timezone);
        } else {
            parent::__construct($time);
        }

        if ($this->isUnixTimestamp($time)) {
            if (!$timezone) {
                $timezone = new \DateTimeZone(date_default_timezone_get());
            }

            $this->setTimezone($timezone);
        }
    }

    /**
     * Checks if an UNIX timestamp is passed.
     *
     * @param string $time A date/time string.
     * @return bool Returns true if the $time parameter is a UNIX timestamp
     */
    protected function isUnixTimestamp($time)
    {
        if (preg_match(self::UNIX_TIMESTAMP_PATTERN, $time)) {
            return true;
        }

        return false;
    }

    public function diffFromNow()
    {
        return time() - $this->getTimestamp();
    }

    public function diffFromNowHumanReadable()
    {
        $diff = $this->diffFromNow();
        $year = $diff / (60*60*24*30*12);
        if($year > 1)
        {
            return intval($year) . ' 年前';
        }
        $month = $diff / (60*60*24*30);
        if($month > 1)
        {
            return intval($month) . ' 月前';
        }
        $day = $diff / (60*60*24);
        if($day > 1)
        {
            return intval($day) . ' 天前';
        }
        $hour = $diff / (60*60);
        if($hour > 1)
        {
            return intval($hour) . ' 小时前';
        }
        $minutes = $diff / 60;
        if($minutes > 1)
        {
            return intval($minutes) . ' 分钟前';
        }
        if($diff > 1)
        {
            return intval($diff) . ' 秒前';
        }
    }
}
