{%if !empty($params['sltBranches']['branches'])%}
<optgroup label="Branch(es)">
{%foreach $params['sltBranches']['branches'] as $branch%}
	<option value="{%$branch%}"{%if isset($params['sourceBranch']) && $params['sourceBranch'] == $branch%} selected{%/if%}>{%$branch%}</option>
{%/foreach%}
</optgroup>
{%/if%}

{%if !empty($params['sltBranches']['tags'])%}
<optgroup label="Tag(s)">
{%foreach $params['sltBranches']['tags'] as $tag%}
	<option value="{%$tag%}"{%if isset($params['sourceBranch']) && $params['sourceBranch'] == $tag%} selected{%/if%}>{%$tag%}</option>
{%/foreach%}
</optgroup>
{%/if%}