{if isset($comment_derivative_params)}
{strip}{html_style}
.commentElement .illustration{
	width:{$comment_derivative_params->max_width()+5}px
}

.content .commentElement .description{
	min-height:{$comment_derivative_params->max_height()+5}px
}
{/html_style}{/strip}
{footer_script}var error_icon = "{$ROOT_URL}{$themeconf.icon_dir}/errors_small.png";{/footer_script}
{/if}
<div id="commentList">
{foreach from=$comments item=comment name=comment_loop}
    <div class="comment">
        <div class="description" >
            {if isset($comment.U_DELETE) or isset($comment.U_VALIDATE) or isset($comment.U_EDIT)}
            <div class="actions">
            {if isset($comment.U_DELETE)}
                <a href="{$comment.U_DELETE}" onclick="return confirm('{'Are you sure?'|@translate|@escape:javascript}');">
                    {'Delete'|@translate}
                </a>{if isset($comment.U_VALIDATE) or isset($comment.U_EDIT) or isset($comment.U_CANCEL)} | {/if}
            {/if}
            {if isset($comment.U_CANCEL)}
                <a href="{$comment.U_CANCEL}">
                    {'Cancel'|@translate}
                </a>{if isset($comment.U_VALIDATE)} | {/if}
            {/if}
            {if isset($comment.U_EDIT) and !isset($comment.IN_EDIT)}
                <a class="editComment" href="{$comment.U_EDIT}#edit_comment">
                    {'Edit'|@translate}
                </a>{if isset($comment.U_VALIDATE)} | {/if}
            {/if}
            {if isset($comment.U_VALIDATE)}
                <a href="{$comment.U_VALIDATE}">
                    {'Validate'|@translate}
                </a>
            {/if}&nbsp;
            </div>
            {/if}

            {*<span>{if $comment.WEBSITE_URL}<a href="{$comment.WEBSITE_URL}" class="external" target="_blank" rel="nofollow">{$comment.AUTHOR}</a>{else}{$comment.AUTHOR}{/if}</span>
                {if isset($comment.EMAIL)}- <a href="mailto:{$comment.EMAIL}">{$comment.EMAIL}</a>{/if}
                - *}
            <span class="commentDate">{$comment.DATE}</span>
            {if isset($comment.IN_EDIT)}
            <a name="edit_comment"></a>
            <form method="post" action="{$comment.U_EDIT}">
                <div class="form-group">
                    <label for="website_url">{'Website'|@translate} :</label>
                    <input class="form-control" type="text" name="website_url" id="website_url" value="{$comment.WEBSITE_URL}">
                </div>
                <div class="form-group">
                    <label for="contenteditid">{'Edit a comment'|@translate} :</label>
                    <textarea class="form-control" name="content" id="contenteditid" rows="5" cols="80">{$comment.CONTENT|@escape}</textarea>
                </div>
                <input type="hidden" name="key" value="{$comment.KEY}">
                <input type="hidden" name="pwg_token" value="{$comment.PWG_TOKEN}">
                <input type="hidden" name="image_id" value="{$comment.IMAGE_ID|@default:$current.id}">
                <button type="submit" class="btn btn-primary btn-raised">{'Submit'|@translate}</button>
            </form>
            {else}
            <blockquote><div>{$comment.CONTENT}</div></blockquote>
            {/if}
        </div>
    </div>
{/foreach}
</div>
