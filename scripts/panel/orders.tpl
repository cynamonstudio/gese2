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

                    {if $articles && count($articles) > 0}
                        {include file='news/listofarticles.tpl'}
                    {/if}

                    <div class="box" id="box_orders">
                        <div class="boxhead">
                            <span>{translate key="Order history"}</span>
                        </div>

                        <div class="innerbox">
                            <table class="orders classic table">
                                <thead>
                                    <tr>
                                        <th class="id">{translate key='ID'}</th>
                                        <th class="date rwd-hide-medium">{translate key='Order date'}</th>
                                        <th class="sum">{translate key='Value'}</th>
                                        <th class="shipping">{translate key='Shipping method'}</th>
                                        {if $config_confirm}<th class="status">{translate key='Confirmation'}</th>{/if}
                                        <th class="actions">{translate key='Actions'}</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    {foreach from=$orders item=order name=list}
                                        {assign var=id value=$order->getIdentifier()}
                                        <tr class="{if $smarty.foreach.list.index % 2}odd{else}even{/if}">
                                            <td class="id">{$id|escape}</td>
                                            <td class="date rwd-hide-medium">{date value=$order->order->date}</td>
                                            <td class="{if $order->sumOrder() == $order->order->paid}paid{else}notpaid{/if}">{currency value=$order->sumOrder() id=$order->order->currency_id rate=$order->order->currency_rate}</td>
                                            <td class="shipping">{$order->shipping->translation->name|escape}</td>

                                            {if $config_confirm}
                                                <td class="status">
                                                    {if 1 == $order->order->confirm}
                                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1 confirmed" >
                                                        <span class="confirmed">{translate key='confirmed'}</span>
                                                    {else}
                                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1 notconfirmed" >
                                                        <span class="notconfirmed">{translate key='none!'}</span>
                                                    {/if}
                                                </td>
                                            {/if}

                                            <td class="actions">
                                                <a href="{route key='panelOrder' orderId=$id}" class="details btn btn-red spanhover" title="{translate key='Order details'}" aria-label="{translate key='Order details'} {$id|escape}">
                                                    <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" >
                                                    <span>{translate key='details'}</span>
                                                </a>

                                                {if $order->getAmountToPay() > 0 && $order->hasSupportOnlinePayment()}
                                                    {assign var=onlinepayment value=$order->getOnlinePayment()}
                                                    {if $onlinepayment->isPaymentFromPanelAllowed()}
                                                        <a href="{route key='panelPayment' orderId=$id}" class="payment btn spanhover js__payment-link">
                                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" >
                                                            <span>{translate key='pay'}</span>
                                                        </a>
                                                    {/if}
                                                {/if}

                                                {if $order->invoice && true == $show_invoice}
                                                    <a href="{baseDir}/console/invoices/pdf/id/{$order->invoice->invoice->invoice_id}" class="invoice btn spanhover" aria-label="{translate key='Invoice for order'} {$id|escape}">
                                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1" >
                                                        <span>{translate key='invoice'}</span>
                                                    </a>
                                                {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
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
