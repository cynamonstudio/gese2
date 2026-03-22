{include file='header.tpl'}
<body{if $body_id} id="{$body_id|escape}"{/if}{if $body_class} class="{$body_class|escape}"{/if}>
{include file='body_head_checkout.tpl'}
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

                    <div class="box" id="box_basketstep2">
                        <div class="basket-step-border">

                            {if count($providers) > 0}
                                <div class="social-login-buttons">
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

                            <div class="innerbox r--l-flex r--l-spacing-horizontal r--l-flex-stretch r--l-border-between">
                                {if $enable_register}
                                    <div class="register r--l-flex r--l-column r--l-flex-spacebetween {if $allow_single}r--l-box-3-5{else}r--l-box-6{/if}">
                                        <div class="r--spacing-s">
                                            <h3>
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                {translate key="I do not have an account yet"}
                                            </h3>

                                            <p>{translate key='Sign up to take advantage of the privileges for returning customers'}:</p>
                                            <ul>
                                                <li>{translate key='view the order status and purchase history'}</li>
                                                <li>{translate key='no need to enter your data for next purchases'}</li>
                                                <li>{translate key='possibility to receive discounts and discount codes'}</li>
                                                {if $loyalty_order_gives_points}
                                                <li>{translate key='you can collect loyalty points for your shopping'}</li>
                                                {/if}
                                            </ul>
                                        </div>

                                        <form action="{route key='basketRegister'}" method="get" class="register">
                                            <fieldset>
                                                <button class="btn btn-red important register" type="submit">
                                                    <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                    <span>{translate key='Create an account'}</span>
                                                </button>
                                            </fieldset>
                                        </form>
                                    </div>
                                {/if}

                                {if $allow_single}
                                    <div class="basket-no-register r--l-flex r--l-column r--l-flex-spacebetween {if $enable_register} r--l-box-3-5 register-enabled{else} r--l-box-5{/if}">
                                        <div class="r--spacing-s">
                                            <h3>
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                {if $enable_register === false}
                                                    {translate key="I do not have an account"}
                                                {else}
                                                    {translate key="Continue as a guest"}
                                                {/if}
                                            </h3>
                                            
                                            <p>{translate key="You don't have to create an account in our store to place an order."}</p>
                                            <p>{translate key='Click "Place an order" button'}</p>
                                        </div>

                                        <form action="{route key='basketNoRegister'}" method="get" class="order">
                                            <button class="btn btn-red important order" type="submit">
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                <span>{translate key='Place an order'}</span>
                                            </button>
                                        </form>
                                    </div>
                                {/if}

                                <div class="login r--l-flex r--l-column r--l-flex-spacebetween {if $allow_single && $enable_register}r--l-box-3-5{elseif $allow_single || $enable_register}r--l-box-5{else}r--l-box-10{/if}">
                                    <h3>
                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                        {translate key='I already have an account'}
                                    </h3>

                                    <form action="{route key='basketStep2'}" method="post" class="login" novalidate>
                                        <fieldset>
                                            <div class="form-line">
                                                <input type="hidden" name="loginform" value="1">
                                                <label for="input_mail">{translate key='E-mail'}:</label>
                                                <div class="shaded_inputwrap">
                                                    <input type="email" class="" name="mail" value="{$data.mail}" id="input_mail">
                                                </div>
                                            </div>

                                            <div class="form-line">
                                                <label for="input_pass">{translate key='Password'}:</label>
                                                <div class="shaded_inputwrap">
                                                    <input type="password" class="" name="pass" value="{$data.pass}" id="input_pass">
                                                </div>
                                            </div>

                                            <div class="form-line r--spacing-s">
                                                <label for="input_pass"></label>
                                                <div class="shaded_inputwrap inline">
                                                    {translate key="%sForgot your password?%s" fallback='Forgot your password? %sClick here%s.' p1="<a href=\"$passlink\">" p2='</a>'}                                                
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-red important">
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                <span>{translate key='Sign in'}</span>
                                            </button>
                                        </fieldset>
                                    </form>
                                </div>
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
