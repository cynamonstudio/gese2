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

                    <div class="box" id="box_passchange">
                        <div class="boxhead">
                            <span>{translate key="Password change"}</span>
                        </div>

                        <div class="innerbox">
                            <form action="{route key='passremind'}" method="post">
                                <fieldset>
                                    {include file='formantispam.tpl'}
                                    <label for="mail_input2">{translate key="Your e-mail address"}:</label>

                                    <div class="shaded_inputwrap{if $data_error.remindmail} error{/if}">
                                        <input type="text" name="remindmail" id="mail_input2" value="{$remindmail|escape}" size="30">
                                    </div>

                                    <div class="floatfix"></div>

                                    {$recaptcha}

                                    <div class="bottombuttons">
                                        <button type="submit" class="btn passchange">
                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                            <span>{translate key="Change password"}</span>
                                        </button>
                                    </div>
                                </fieldset>
                            </form>

                            <div class="rightside"></div>
                        </div>

                        <div class="bottombar"> <div class="leftcorner"></div> <div class="rightcorner"></div> </div>
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
