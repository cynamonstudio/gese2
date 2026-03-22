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

                    {if 'products' == $skin_settings->main->mode && count($products)}
                        <div class="box" id="box_mainproducts">
                            <div class="boxhead">
                                <h1 class="category-name row"><img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">{translate key="Recommended products"}</h1>

                                <div class="sort-and-view">
                                    {if 1 == $skin_settings->productlist->allowviewchange}
                                        <ul class="prodview inline text-right">
                                            <li class="photo{if 'phot' == $view} selected{/if}">
                                                <a class="fa fa-th" href="{route function='indexpage' key=0 page=1 sort=1 view='phot'}{if $google}?{$google|escape}{/if}" title="{translate key='Picture view'}"></a>
                                            </li>
                                            <li class="full{if 'full' == $view} selected{/if}">
                                                <a class="fa fa-th-list" href="{route function='indexpage' key=0 page=1 sort=1 view='full'}{if $google}?{$google|escape}{/if}" title="{translate key='Full view'}"></a>
                                            </li>
                                        </ul>
                                    {/if}
                                </div>

                                <div class="row search-info">                
                                    {if 'search' == $list_type}
                                        <b class="count">{translate key='Products found'}: {$products->getTotalItemCount()}</b>
                                    {/if}
                                </div>
                            </div>
                            
                            <div class="innerbox">
                                    {include file='product/tableofproducts.tpl'}
                                    {if $products->getTotalItemCount() > $products->getItemCountPerPage()}
                                        <div class="floatcenterwrap row">
                                            {include file='paginator.tpl'}
                                        </div>
                                    {/if}
                            </div>
                        </div>
                    {/if}

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

    <script type="application/ld+json">
        {literal}
            {
            "@context": "http://schema.org",
            "@type": "WebSite",
            "url": "{/literal}{$shop_url}{literal}",
            "potentialAction": {
                "@type": "SearchAction",
                "target": "{/literal}{$shop_url}/{lang key='long'}/searchquery/{literal}{search_term_string}{/literal}/1/{$view}/5?url={literal}{search_term_string}",
                "query-input": "required name=search_term_string"
            }
            }
        {/literal}
    </script>
</body>
</html>
