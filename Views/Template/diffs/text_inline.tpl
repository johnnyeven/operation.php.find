<div class="diff-file" id="diff-{%$key%}">
	<div class="diff-header">
		<span>{%$diffFile->file_name%}</span>
		<div class="diff-btn-group">
			<a class="btn btn-default btn-sm active has_tooltip" href="#" title="Toggle comments for this file"><i class="fa fa-comments"></i></a>&nbsp;
			<a class="btn btn-default btn-sm view-file js-view-file" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/blob/{%$params['hash']%}/{%$diffFile->file_name%}">View file @<span class="commit-short-id">{%$params['shorthash']%}</span></a>
		</div>
	</div>
	<div class="diff-content diff-wrap-lines">
		<table class="text-file">
			<tbody>
			{%foreach $diffFile->sections as $section%}
				<tr class="line_holder match">
					<td class="diff-line-num js-unfold old_line unfold" data-linenumber="{%$section->left_line_offset%}">
						...
					</td>
					<td class="diff-line-num js-unfold new_line unfold" data-linenumber="{%$section->right_line_offset%}">
						...
					</td>
					<td class="line_content matched">{%$section->header%}</td>
				</tr>
				{%foreach $section->lines as $line%}
				<tr class="line_holder{%if $line->mode == 1%} new{%elseif $line->mode == -1%} old{%/if%}" id="d564d6217b0bb536335f921f3b5382f0396564c5_27_27">
					<td class="old_line">
						<a href="#d564d6217b0bb536335f921f3b5382f0396564c5_27_27">{%$line->line_numbers['left']%}</a>
					</td>
					<td class="new_line" data-linenumber="{%$line->line_numbers['right']%}">
						<a href="#d564d6217b0bb536335f921f3b5382f0396564c5_27_27">{%$line->line_numbers['right']%}</a>
					</td>
					<td class="line_content noteable_line{%if $line->mode == 1%} new{%elseif $line->mode == -1%} old{%/if%}">{%if !empty($line->line)%}{%htmlspecialchars($line->line)%}{%else%}&nbsp;{%/if%}</td>
				</tr>
				{%/foreach%}
			{%/foreach%}
			</tbody>
		</table>
	</div>
</div>