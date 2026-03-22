{feature name="module_text_and_image_2_columns"}
    {if isset($boxNs->$box_id->baseConfig) && !empty($boxNs->$box_id->baseConfig)}
        <div class="content-module" id="{if $boxNs->$box_id->css}{$boxNs->$box_id->css|escape}{else}box_content_{$box_id|escape}{/if}">
            {if $boxNs->$box_id->baseConfig->headerAboveModule }
                <h2 class="content-module__header">
                    {$boxNs->$box_id->baseConfig->headerAboveModule|escape}
                </h2>
            {/if}

            <div class="content-module__body {if $boxNs->$box_id->baseConfig->layout == 'vertical'}content-module__body_vertical r--l-column{else}content-module__body_horizontal{/if} r--l-flex">
                {if $boxNs->$box_id->firstColumn->type == 'image' }
                    <div class="content-module__item content-module__item_img content-module__item_{$boxNs->$box_id->baseConfig->contentAlign} r--l-flex r--l-box-5 r--l-column"
                        {if $boxNs->$box_id->secondColumn->type == 'text' && $boxNs->$box_id->secondColumn->data->hasBackgroundBelowContent && $boxNs->$box_id->secondColumn->data->backgroundColor}
                            style="background-color: {$boxNs->$box_id->secondColumn->data->backgroundColor|escape};"
                        {/if}
                    >
                        <figure class="content-module__img-wrapper">
                            {if $boxNs->$box_id->firstColumn->data->isLink}
                            <a
                                    href="{$boxNs->$box_id->firstColumn->data->linkHref|escape}"
                                    {if $boxNs->$box_id->firstColumn->data->openInNewTab}
                                target="_blank"
                                rel="noopener noreferrer"
                                    {/if}>
                                {/if}

                                <img src="{$boxNs->$box_id->firstColumn->data->imageSrc|escape}" alt="{$boxNs->$box_id->firstColumn->data->imageAlt|escape}">

                                {if $boxNs->$box_id->firstColumn->data->isLink}
                            </a>
                            {/if}
                        </figure>
                    </div>
                {/if}

                {if $boxNs->$box_id->firstColumn->type == 'text' }
                    <div
                            class="content-module__item content-module__item_text content-module__item_{$boxNs->$box_id->baseConfig->contentAlign} r--l-flex r--l-box-5 r--l-column"
                            {if $boxNs->$box_id->firstColumn->data->hasBackgroundBelowContent}
                                {if $boxNs->$box_id->firstColumn->data->backgroundColor}
                                    style="background-color: {$boxNs->$box_id->firstColumn->data->backgroundColor|escape}; padding: 3rem;"
                                {/if}
                                {if $boxNs->$box_id->firstColumn->data->backgroundImage}
                                    style="background-image: url({$boxNs->$box_id->firstColumn->data->backgroundImage|escape}); padding: 3rem;"
                                {/if}
                            {/if}>

                        <div class="resetcss fr-view">
                            {$boxNs->$box_id->firstColumn->data->content}
                        </div>

                        {if $boxNs->$box_id->firstColumn->data->linkMode == 'link' }
                            <div class="content-module__buttons">
                                <a

                                        class="{if $boxNs->$box_id->firstColumn->data->linkType == 'primaryButton'}btn btn-red{elseif $boxNs->$box_id->firstColumn->data->linkType == 'secondaryButton'}btn{else}link{/if}"
                                        href="{$boxNs->$box_id->firstColumn->data->linkHref|escape}"
                                        {if $boxNs->$box_id->firstColumn->data->openLinkInNewTab}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                        {/if}>
                                    {$boxNs->$box_id->firstColumn->data->linkText|escape}
                                </a>
                            </div>
                        {/if}
                    </div>
                {/if}

                {if $boxNs->$box_id->secondColumn->type == 'image' }
                    <div class="content-module__item content-module__item_img content-module__item_{$boxNs->$box_id->baseConfig->contentAlign} r--l-flex r--l-box-5 r--l-column"
                        {if $boxNs->$box_id->firstColumn->type == 'text' && $boxNs->$box_id->firstColumn->data->hasBackgroundBelowContent && $boxNs->$box_id->firstColumn->data->backgroundColor}
                            style="background-color: {$boxNs->$box_id->firstColumn->data->backgroundColor|escape};"
                        {/if}
                    >
                        <figure class="content-module__img-wrapper">
                            {if $boxNs->$box_id->secondColumn->data->isLink}
                            <a
                                    href="{$boxNs->$box_id->secondColumn->data->linkHref|escape}"
                                    {if $boxNs->$box_id->secondColumn->data->openInNewTab}
                                target="_blank"
                                rel="noopener noreferrer"
                                    {/if}>
                                {/if}

                                <img src="{$boxNs->$box_id->secondColumn->data->imageSrc|escape}" alt="{$boxNs->$box_id->secondColumn->data->imageAlt|escape}">

                                {if $boxNs->$box_id->secondColumn->data->isLink}
                            </a>
                            {/if}
                        </figure>
                    </div>
                {/if}

                {if $boxNs->$box_id->secondColumn->type == 'text' }
                    <div
                            class="content-module__item content-module__item_text content-module__item_{$boxNs->$box_id->baseConfig->contentAlign} r--l-flex r--l-box-5 r--l-column"
                            {if $boxNs->$box_id->secondColumn->data->hasBackgroundBelowContent}
                                {if $boxNs->$box_id->secondColumn->data->backgroundColor}
                                    style="background-color: {$boxNs->$box_id->secondColumn->data->backgroundColor|escape}; padding: 3rem;"
                                {/if}
                                {if $boxNs->$box_id->secondColumn->data->backgroundImage}
                                    style="background-image: url({$boxNs->$box_id->secondColumn->data->backgroundImage|escape}); padding: 3rem;"
                                {/if}
                            {/if}>

                        <div class="resetcss fr-view">
                            {$boxNs->$box_id->secondColumn->data->content}
                        </div>

                        {if $boxNs->$box_id->secondColumn->data->linkMode == 'link' }
                            <div class="content-module__buttons">
                                <a

                                        class="{if $boxNs->$box_id->secondColumn->data->linkType == 'primaryButton'}btn btn-red{elseif $boxNs->$box_id->secondColumn->data->linkType == 'secondaryButton'}btn{else}link{/if}"
                                        href="{$boxNs->$box_id->secondColumn->data->linkHref|escape}"
                                        {if $boxNs->$box_id->secondColumn->data->openLinkInNewTab}
                                    target="_blank"
                                    rel="noopener noreferrer"
                                        {/if}>
                                    {$boxNs->$box_id->secondColumn->data->linkText|escape}
                                </a>
                            </div>
                        {/if}
                    </div>
                {/if}
            </div>
        </div>
    {/if}
{/feature}