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

                    <div class="box" id="box_basketfinal">
                        <div class="boxhead">
                            <span>
                                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                {translate key='Thank you for your order'}
                            </span>
                        </div>
                        <div class="innerbox">
                            {$payment_message}
                            {$snippet_order}
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
<script>
    try {literal}{{/literal}
        {literal}
            window.Shop = window.Shop || {};
            window.Shop.values = window.Shop.values || {};
        {/literal}
        Shop.values.ShippingHidden = {$extra_step};
        Shop.shippingDone = Shop.shippingDone || {literal}{}{/literal};
        Shop.shippingDone.dataClient = {literal}{{/literal}
            id: '{$order->getIdentifier()}',
            revenue: '{currency value=$order->sumOrder() float_currency=true}',
            shipping: '{currency value=$order->order->shipping_cost float_currency=true}',
            tax: '{currency value=$order->getTaxValue(true) float_currency=true}'
      {literal}}{/literal};

        Shop.shippingDone.clientProducts = [
          {foreach from=$order->products item=product name=products}
              {if !$product->isChild()}
                  {literal}{{/literal}
                      id: '{$product->productObject->product->product_id}',
                      name: '{$product->product->name|replace:"'":"\'"}',
                      category: '{if $product->productObject && $product->productObject->defaultCategory->translation->name|escape}{$product->productObject->defaultCategory->translation->name|escape}{/if}',
                      price: '{currency value=$product->product->price float_currency=true}',
                      quantity: '{$product->product->quantity}',
                      brand: '{if $product->productObject && $product->productObject->product->producer_id}{$product->productObject->producer->manufacturer->name|escape}{/if}',
                      variant: '{$product->getOptionsString()|escape}'
                  {literal}}{/literal}{if !$smarty.foreach.products.last},{/if}
              {/if}
          {/foreach}
        ]
    {literal}}{/literal} catch(e) {literal}{ }{/literal}
</script>
{plugin module=shop template=basket_done}
{include file='footerbox.tpl'}
{include file='footer.tpl' force_include_cache='1' force_include_cache_tags='Logic_SkinFooterGroupList,Logic_SkinFooterLinkList,Logic_SkinFooterGroup,Logic_SkinFooterLink'}
{plugin module=shop template=footer}
{include file='switch.tpl'}
</body>
</html>