{include file='header.tpl'}
<body{if $body_id} id="{$body_id|escape}"{/if}{if $body_class} class="{$body_class|escape}"{/if}>
    {include file='body_head.tpl'}
    <div class="main row">
        <div class="innermain container">
            <div class="s-row">
                {if 0 < $boxes_left_side|@count}
                    <div class="leftcol large s-grid-3">
                        {boxesLeft}
                    </div>
                {/if}

                <div class="centercol {if ($boxes_left_side|@count == 0) and ($boxes_right_side|@count == 0)}s-grid-12{elseif 0 != $boxes_left_side|@count and $boxes_right_side|@count != 0}s-grid-6{else}s-grid-9{/if}">
                    {boxesTop}

                    <div class="box" id="box_newsletterunsign">
                        <div class="boxhead">
                            <h3>
                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                {translate key="Unsubscribe from our newsletter"}
                            </h3>
                        </div>

                        <div class="innerbox">
                            <form action="{route key='newsletterUnsign'}" method="post">
                                <fieldset>
                                    <label for="email_input1">{translate key="Enter your e-mail address to unsubscribe."}</label>
                                    <div class="shaded_inputwrap{if $data_error.email} error{/if}">
                                        <input type="text" name="email" id="email_input1" value="{$email|escape}" size="30">
                                    </div>

                                    <button type="submit" class="btn unsign">
                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                        <span>{translate key="Unsubscribe"}</span>
                                    </button>
                                </fieldset>
                            </form>
                        </div>
                    </div>

                    {boxesBottom}
                </div>

                {if 0 < $boxes_right_side|@count}
                    <div class="rightcol large s-grid-3">
                        {boxesRight}
                    </div>
                {/if}
            </div>
        </div>
    </div>
{include file='footerbox.tpl'}
{include file='footer.tpl' force_include_cache='1' force_include_cache_tags='Logic_SkinFooterGroupList,Logic_SkinFooterLinkList,Logic_SkinFooterGroup,Logic_SkinFooterLink'}
{plugin module=shop template=footer}
{include file='switch.tpl'}
</body>
</html>
