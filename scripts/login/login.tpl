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

                    <div class="box" id="box_login">
                        {if count($providers) > 0}
                            <div class="social-login-buttons social-login-buttons_no-border">
                                <h3>
                                    {translate key="Log in using social media" fallback="Continue with"}
                                </h3>

                                {foreach from=$providers item=provider}
                                    {if $provider.type == 'link'}
                                        <a class="btn {$provider.class|escape} r--hspacing-xs" href="{$provider.href|escape}">
                                             {if $provider.class == 'btn-login-shoper_sso'}
                                                {translate key="Login with"}
                                                <img width="85" height="19" class="shoper_sso__logo shoper_sso__logo_dark" src="https://dcsaascdn.net/img/logo-shoper-one-white.svg" alt="{$provider.label|escape} logo">
                                                <img width="85" height="19" class="shoper_sso__logo shoper_sso__logo_light" src="https://dcsaascdn.net/img/logo-shoper-one-dark.svg" alt="{$provider.label|escape} logo">
                                            {else}
                                                {$provider.label|escape}
                                            {/if}
                                        </a>
                                    {/if}
                                {/foreach}

                                {if $canShowSsoLegalNotes}
                                    <p>
                                        <small>
                                            {translate key="Login via Facebook and Google to %s is provided as part of the Shoper ONE service." s1=$shop_name}
                                        </small>
                                    </p>
                                {/if}
                            </div>
                        {/if}

                        <div class="innerbox">
                            <div class="f-row">
                                <form action="{route key='login'}" method="post" class="f-grid-6 login-inner">
                                    <fieldset class="">
                                        <h3 class="login-head"><img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1"><span>{translate key="Sign in"}</span></h3>
                                        {include file='formantispam.tpl'}
                                        <input type="hidden" name="last_url" value="{$last_url|escape}" />
                                        <label for="mail_input_long">{translate key="E-mail"}:</label>
                                        <input type="text" name="mail" id="mail_input_long" size="30">
                                        <label for="pass_input_long">{translate key="Password"}:</label>
                                        <input type="password" name="pass" id="pass_input_long" size="30">
                                        {$recaptcha}
                                        <button type="submit" class="btn btn-red login">
                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                            <span>{translate key="Sign in"}</span>
                                        </button>
                                        <p>{translate key="%sForgot your password?%s" fallback='Forgot your password? %sClick here%s.' p1="<a href=\"$passlink\">" p2='</a>'}</p>
                                    </fieldset>
                                </form>   

                                {if $enable_register}
                                    <div class="f-grid-6 register-inner">
                                        <h3 class="register-head">
                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                            <span>{translate key="Create an account"}</span>
                                        </h3>

                                        <p>{translate key='You will receive additional benefits'}:</p>

                                        <ul class="register-addons">
                                            <li>{translate key='view the status of orders'} </li>
                                            <li>{translate key='purchase history preview'}</li>
                                            <li>{translate key='no need to enter your data for next purchases'}</li>
                                            <li>{translate key='possibility to receive discounts and discount codes'}</li>
                                        </ul> 

                                        <form action="{route key='register'}" method="get" class="register-form">
                                            <fieldset>
                                                {include file='formantispam.tpl'}
                                                <button type="submit" class="btn register">
                                                    <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                    <span>{translate key="Create an account"}</span>
                                                </button>
                                            </fieldset>
                                        </form>                                           
                                    </div>
                                {/if}
                            </div>
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
