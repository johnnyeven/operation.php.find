<?php

namespace Extend\Library;

class PrettyFormat
{
    public function parse($output)
    {
        if (empty($output)) {
            throw new \RuntimeException('No data available');
        }

        $data = $this->iteratorToArray(new \SimpleXmlIterator("<data>$output</data>"));

        return $data['item'];
    }

    protected function iteratorToArray($iterator)
    {
        $data = [];
        foreach ($iterator as $key => $item) {
            if ($iterator->hasChildren()) {
                $data[$key][] = $this->iteratorToArray($item);
                continue;
            }

            $data[$key] = trim(strval($item));
        }

        return $data;
    }
}
