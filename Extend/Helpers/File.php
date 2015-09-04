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

if(!function_exists('getFileType'))
{
    function getFileType($fileName)
    {
        $defaultFileTypes = array(
            'php'      => 'php',
            'c'        => 'c_cpp',
            'h'        => 'c_cpp',
            'cpp'      => 'c_cpp',
            'm'        => 'objectivec',
            'mm'       => 'objectivec',
            'ino'      => 'c_cpp',
            'cs'       => 'csharp',
            'java'     => 'java',
            'clj'      => 'clojure',
            'coffee'   => 'coffeescript',
            'css'      => 'css',
            'diff'     => 'diff',
            'ecl'      => 'ecl',
            'el'       => 'erlang',
            'go'       => 'golang',
            'groovy'   => 'groovy',
            'hs'       => 'haskell',
            'lhs'      => 'haskell',
            'jsp'      => 'jsp',
            'asp'      => 'vbscript',
            'aspx'     => 'csharp',
            'html'     => 'html',
            'tpl'      => 'smarty',
            'js'       => 'javascript',
            'json'     => 'javascript',
            'less'     => 'less',
            'lua'      => 'lua',
            'md'       => 'markdown',
            'markdown' => 'markdown',
            'sql'      => 'mysql',
            'ml'       => 'ocaml',
            'mli'      => 'ocaml',
            'pl'       => 'perl',
            'pm'       => 'perl',
            'pas'      => 'pascal',
            'ini'      => 'ini',
            'cfg'      => 'properties',
            'nt'       => 'ntriples',
            'py'       => 'python',
            'rb'       => 'ruby',
            'rst'      => 'rst',
            'r'        => 'r',
            'sh'       => 'powershell',
            'ss'       => 'scheme',
            'scala'    => 'scala',
            'scm'      => 'scheme',
            'sls'      => 'scheme',
            'sps'      => 'scheme',
            'rs'       => 'rust',
            'st'       => 'smalltalk',
            'tex'      => 'stex',
            'vbs'      => 'vbscript',
            'vb'       => 'vbscript',
            'v'        => 'verilog',
            'xml'      => 'xml',
            'xsd'      => 'xml',
            'xsl'      => 'xml',
            'xul'      => 'xml',
            'xlf'      => 'xml',
            'xliff'    => 'xml',
            'xaml'     => 'xml',
            'wxs'      => 'xml',
            'wxl'      => 'xml',
            'wxi'      => 'xml',
            'wsdl'     => 'xml',
            'svg'      => 'xml',
            'rss'      => 'xml',
            'rdf'      => 'xml',
            'plist'    => 'xml',
            'mxml'     => 'xml',
            'kml'      => 'xml',
            'glade'    => 'xml',
            'xq'       => 'xquery',
            'xqm'      => 'xquery',
            'xquery'   => 'xquery',
            'xqy'      => 'xquery',
            'yml'      => 'yaml',
            'yaml'     => 'yaml',
            'png'      => 'image',
            'jpg'      => 'image',
            'gif'      => 'image',
            'jpeg'     => 'image',
            'bmp'      => 'image',
            'csproj'   => 'xml',
        );

        if (($pos = strrpos($fileName, '.')) !== false) {
            $fileType = substr($fileName, $pos + 1);
        } else {
            return 'plain_text';
        }

        if (isset($defaultFileTypes[$fileType])) {
            return $defaultFileTypes[$fileType];
        }

        return 'plain_text';
    }
}