<!DOCTYPE html>
<!--[if lte IE 8]>     <html lang="{lang key='short'}" class="lt-ie8"> <![endif]-->
<!--[if IE 9]>         <html lang="{lang key='short'}" class="lt-ie8 lt-ie9"> <![endif]-->
<!--[if gt IE 9]><!--> <html data-pwa="1" lang="{lang key='short'}"> <!--<![endif]-->
<head data-features="{featureFlags}" data-ajaxbasket-mode="{$basket_mode}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <title>{$seo_title|escape}</title>
    <meta name="keywords" content="{$seo_keywords|escape}" />
    <meta name="description" content="{$seo_description|escape}" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0">
    <meta name="mobile-web-app-capable" content="yes">
    
    <link rel="home" href="{baseDir nonempty=1}" />
    <link rel="shortcut icon" href="{$path}images/favicon.png">
    {pwa}
        <link rel="manifest" href="{baseDir}/userdata/public/manifest.json">
        <link rel="apple-touch-icon" sizes="192x192" href="{baseDir}/userdata/public/pwa/icons/192x192_icon.png">
    {/pwa}
    
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link rel="preconnect" href="//fonts.gstatic.com">
    <link rel="preload" as="font" type="font/woff" href="{$path}images/rwd-custom.woff?gptqpz" crossorigin>
    <link rel="preload" as="font" type="font/woff" href="{$path}images/fontawesome-webfont.woff?v=4.0.3" crossorigin>

    {plugin module=shop template=pre-head}
    
    <link id="csslink" rel="stylesheet" type="text/css" href="{less id=$skin_id}" />

    <script type="text/javascript" src="{baseDir}/assets/js/frontstore/main.{frontRwdHash}.min.js"></script>
    <script type="text/javascript" src="{baseDir}/userdata/public/locales/{$lang_full}.js?sci={$skin_cache_iterator}"></script>
    {if $user_js}
        <script type="text/javascript" src="{$path}js/user.js?sci={$skin_cache_iterator}"></script>
    {/if}

    {if count($seo_links)}
        {foreach from=$seo_links item=v key=k}
            <link rel="{$k|escape}" href="{$v|escape}" />
        {/foreach}
    {/if}

    {if count($opengraph_header)}
        {foreach from=$opengraph_header item=v key=k}
            {if strlen($v)}
                <meta property="og:{$k|escape}" content="{$v|escape}" />
            {/if}
        {/foreach}
    {/if}
    
    {$snippet_head}
    
    {plugin module=shop template=post-head}
</head>
