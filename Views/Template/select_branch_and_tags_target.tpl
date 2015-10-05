{%if !empty($params['sltBranches']['branches'])%}
<optgroup label="Branch(es)">
{%foreach $params['sltBranches']['branches'] as $branch%}
	<option value="{%$branch%}"{%if isset($params['targetBranch']) && $params['targetBranch'] == $branch%} selected{%/if%}>{%$branch%}</option>
{%/foreach%}
</optgroup>
{%/if%}

{%if !empty($params['sltBranches']['tags'])%}
<optgroup label="Tag(s)">
{%foreach $params['sltBranches']['tags'] as $tag%}
	<option value="{%$tag%}"{%if isset($params['targetBranch']) && $params['targetBranch'] == $tag%} selected{%/if%}>{%$tag%}</option>
{%/foreach%}
</optgroup>
{%/if%}