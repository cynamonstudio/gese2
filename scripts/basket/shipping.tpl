{include file='header.tpl'}
<body {if $body_id} id="{$body_id|escape}"{/if}{if $body_class} class="{$body_class|escape}"{/if}>
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

                    <div class="box unibox" id="box_basketshipping">
                        <div class="innerbox">
                                <form method="post" action="{route key='basketStep3'}">
                                    <div class="clearfix">
                                        {if count($shippings)}
                                            <div 
                                                class="shipping-container {if $phone_validation} js__basket-extra-step-shippings{/if}"
                                                {if $phone_validation}
                                                    data-phone-number-shipping-country="{$phone_shipping_country}"
                                                {/if}>
                                                    <h5>{translate key="Shipping method"}:</h5>

                                                    {foreach from=$shippings item=shipping name=list}
                                                        <div 
                                                            {if $shipping->shipping->engine} 
                                                                data-engine="{$shipping->shipping->engine|escape}"
                                                            {/if} 
                                                            class="delivery{if $shipping_id == (int) $shipping->getIdentifier()} selected{/if}{if 0 == $smarty.foreach.list.index} first{/if}">
                                                                <span class="name">
                                                                    <span class="radio-wrap">
                                                                        <input type="radio" name="shipping_id" id="shipping_{$shipping->getIdentifier()}" value="{$shipping->getIdentifier()}" {if $shipping_id == (int) $shipping->getIdentifier()}checked="checked" {/if}/>
                                                                        <label for="shipping_{$shipping->getIdentifier()}"></label>
                                                                    </span>
                                                                    <label for="shipping_{$shipping->getIdentifier()}">{$shipping->translation->name|escape}</label>
                                                                    <span class="description">
                                                                        {if $shipping->shipping->engine == 'personal' && $warehousesConfig && $warehousesConfig->isEnabled()}
                                                                            <br>
                                                                            ({if !$shipping->warehouse->warehouse->city || !$shipping->warehouse->warehouse->street1}
                                                                                {$shipping->warehouse->warehouse->name|escape}
                                                                            {else}
                                                                                {$shipping->warehouse->warehouse->city|escape}, {$shipping->warehouse->warehouse->street1|escape}{if $shipping->warehouse->warehouse->street2}, {$shipping->warehouse->warehouse->street2|escape} {/if}
                                                                            {/if}

                                                                            {if $shipping->warehouse->warehouse->personal_pickup_additional_informations}
                                                                                - {$shipping->warehouse->warehouse->personal_pickup_additional_informations|escape}
                                                                            {/if})
                                                                        {else}
                                                                            {$shipping->translation->description|escape}
                                                                        {/if}
                                                                    </span>
                                                                </span>
                                                                <span class="value">
                                                                    {currency value=$shipping->getCost($user->basket)}
                                                                </span>

                                                                {if $phone_validation && $shipping->shipping->engine|escape === 'inpost'}
                                                                    <div class="hint__content hint__content_right">
                                                                        {translate key="This delivery option requires a Polish telephone number in the address details."}
                                                                    </div>
                                                                {/if}
                                                        </div>
                                                    {/foreach}
                                                    {if $pocztaPolskaPickupPointsIds}
                                                        <div data-pp-pick-up-points class="pp-pick-up-points">
                                                            <input type="hidden" name="pp-pick-up-points-delveries" id="pp-pick-up-points-delveries" value="{$pocztaPolskaPickupPointsIds|escape}">
                                                            <input type="hidden" name="pp-pick-up-points-apikey" id="pp-pick-up-points-apikey" value="{$pocztaPolskaGmapApikey|escape}">
                                                            {if $pocztaPolskaPickupPoint}
                                                                <input type="hidden" name="pp-pick-up-point" id="pp-pick-up-point" value="{$pocztaPolskaPickupPoint|escape}">
                                                            {/if}
                                                        </div>
                                                    {/if}
                                            </div>
                                        {/if}

                                        {if count($payments)}
                                            <div class="payment-container">
                                                <h5>{translate key="Payment method"}:</h5>

                                                {foreach from=$payments item=payment name=list}
                                                    <div class="payment{if $payment_id == (int) $payment->getIdentifier()} selected{/if}{if 0 == $smarty.foreach.list.index} first{/if}">
                                                        <span class="name">
                                                            <span class="radio-wrap">
                                                                <input type="radio" name="payment_id" id="payment_{$payment->getIdentifier()}" value="{$payment->getIdentifier()}" {if $payment_id == (int) $payment->getIdentifier()}checked="checked" {/if}/>
                                                                <label for="payment_{$payment->getIdentifier()}"></label>
                                                            </span>
                                                            <label for="payment_{$payment->getIdentifier()}">
                                                                {$payment->translation->title|escape}
                                                            </label>
                                                            <span class="description">
                                                                {$payment->translation->description|escape}
                                                                {plugin module=shop template=basket-payment-list payment=$payment sum=$sum}
                                                            </span>
                                                            <span class="additional_cost_percent"></span>
                                                        </span>
                                                        <span class="value"></span>
                                                    </div>
                                                {/foreach}
                                            </div>
                                        {/if}
                                    </div>

                                    {plugin module=shop template=basket-extra-step-rwd}

                                    <div class="total-values clearfix">
                                        <div class="promos">
                                            {foreach from=$promos item=promo key=key}
                                                <div class="promo {$key}">
                                                    <span class="desc">
                                                        {$promo.desc|replace:'%d':$promo.val}:
                                                    </span>
                                                    <span class="value">
                                                        {currency value=$promo.price}
                                                    </span>
                                                </div>
                                            {/foreach}
                                        </div>

                                        <div class="product-only">
                                            <span class="desc">
                                                <em>{translate key="Total"}:</em>
                                            </span>
                                            <span class="sum">
                                                {currency value=$user->basket->sumProducts(false, false)}
                                            </span>
                                        </div>

                                        <div class="payment">
                                            <span class="desc">
                                                {translate key="Shipping cost"}:
                                            </span>
                                            <span class="value">
                                            </span>
                                        </div>

                                        <div class="sum">
                                            <span class="desc">
                                                {translate key="To pay"}:
                                            </span>
                                            <span class="value">
                                                {currency value=$sum}
                                            </span>
                                        </div>
                                    </div>

                                    <fieldset class="clearfix">
                                        <input type="hidden" name="shippingform" value="1" >
                                        <div class="bottombuttons">
                                            <button type="submit" name="button1" value="button1" class="btn undo back">
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                <span>{translate key='Back'}</span>
                                            </button>
                                            {if count($shippings) && count($payments)}
                                            <button type="submit" name="button2" value="button2" class="btn right btn-red order">
                                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                                <span>{translate key='Summary'}</span>
                                            </button>
                                            {/if}
                                        </div>
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

    <script type="text/javascript">
        try {literal}{{/literal} 
            {literal}
                window.Shop = window.Shop || {};
                window.Shop.values = window.Shop.values || {};
            {/literal}
            Shop.values.Country2Shipping = {$country2shipping}; 
            Shop.values.Shipping2Payment = {$shipping2payment}; 
            Shop.values.SumNoShipping = {$sum_noship}; 
            Shop.values.ShippingValue = {$shippingvalue}; 
            Shop.values.PaymentAdditional = {$paymentadditional}; 
            Shop.values.CurrencyMap = "{$currencymap}";
        {literal}}{/literal} catch(e) {literal}{}{/literal}
    </script>

{include file='footerbox.tpl'}
{include file='footer.tpl' force_include_cache='1' force_include_cache_tags='Logic_SkinFooterGroupList,Logic_SkinFooterLinkList,Logic_SkinFooterGroup,Logic_SkinFooterLink'}
{plugin module=shop template=footer}
{include file='switch.tpl'}
</body>
</html>
