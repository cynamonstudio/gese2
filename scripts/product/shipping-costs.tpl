{if $product->canBuyStock() && $skin_settings->productdetails->shippingcost == 1 && $enablebasket === true}
    <div class="box row tab" id="box_productdeliveries" tabindex="-1">
        <div class="boxhead tab-head">
            <h3>
                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                {translate key="Shipping costs"}
                
                <span class="hint">
                    <span class="icon icon-help js__tooltip-trigger"></span>

                    <span class="hint__content hint__content_right js__tooltip-content">
                        {translate key='The price does not include any possible payment costs'}
                    </span>
                </span>
            </h3>
        </div>

        <div class="innerbox tab-content product-deliveries">
            <div class="delivery-container" id="deliveries">
                <div class="shipping-country-select">
                    <span>
                        <em>{translate key="Shipping country"}:</em>
                    </span>

                    <span>
                        <select name="shipping-country" class="shipping-country"></select>
                    </span>
                </div>

                <div 
                    class="shippings {if $shipping_extra_step} none{/if}"
                    data-cost-from='{translate key="from"}'
                    data-cost-free='{translate key="Free"}'>
                </div>
            </div>
        </div>
    </div>
{/if}
