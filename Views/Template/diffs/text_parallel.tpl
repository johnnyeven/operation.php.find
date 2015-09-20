<div class="diff-file" id="diff-{%$key%}">
	<div class="diff-header">
		<span>{%$diffFile['name']%}</span>
		<div class="diff-btn-group">
			<a class="js-toggle-diff-comments btn btn-default btn-sm active has_tooltip" href="#" title="Toggle comments for this file"><i class="fa fa-comments"></i></a>&nbsp;
			<a class="btn btn-default btn-small view-file js-view-file" href="{%baseUrl($params['account']->identifier)%}/{%$params['project']->identifier%}/blob/{%$params['hash']%}/{%$diffFile['name']%}">View file @<span class="commit-short-id">{%$params['shorthash']%}</span></a>
		</div>
	</div>
	<div class="diff-content diff-wrap-lines">
		<!-- Side-by-side diff view -->
		<div class="text-file diff-wrap-lines">
			<table>
				<tbody>
				{%foreach $diffFile['sections'] as $section%}
					<tr class="line_holder parallel">
						<td class="old_line">...</td>
						<td class="line_content parallel matched">{%$section['header']%}</td>
						<td class="new_line">...</td>
						<td class="line_content parallel matched">{%$section['header']%}</td>
					</tr>
					{%foreach $section['lines'] as $line%}
					<tr class="line_holder parallel">
						<td class="old_line{%if $line['mode'] == 1 && !empty($line['left_number'])%} new{%elseif $line['mode'] == -1 && !empty($line['left_number'])%} old{%/if%}">
							<a href="#7e4236d52be97c27b39671ca059e4e8045775fb9_164_164">{%$line['left_number']%}</a>
						</td>
						<td class="line_content noteable_line parallel{%if $line['mode'] == 1 && !empty($line['left_number'])%} new{%elseif $line['mode'] == -1 && !empty($line['left_number'])%} old{%/if%}">{%if !empty($line['left_number'])%}{%htmlspecialchars($line['left_content'])%}{%/if%}</td>
						<td class="new_line{%if $line['nextMode'] == 1 && !empty($line['right_number'])%} new{%elseif $line['nextMode'] == -1 && !empty($line['right_number'])%} old{%/if%}" data-linenumber="{%$line['right_number']%}">
							<a href="#7e4236d52be97c27b39671ca059e4e8045775fb9_164_164">{%$line['right_number']%}</a>
						</td>
						<td class="line_content noteable_line parallel{%if $line['nextMode'] == 1 && !empty($line['right_number'])%} new{%elseif $line['nextMode'] == -1 && !empty($line['right_number'])%} old{%/if%}">{%if !empty($line['right_number'])%}{%htmlspecialchars($line['right_content'])%}{%/if%}</td>
					</tr>
					{%/foreach%}
				{%/foreach%}
				</tbody>
			</table>
		</div>

	</div>
</div>