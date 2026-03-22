{if $boxNs->$box_id->force_show || count($boxNs->$box_id->images)}
    <div 
        class="box box-slider"
        id="box_slider{if $boxNs->$box_id->is_custom}_{$box_id|escape}{/if}"
        aria-roledescription="carousel"
        role="region"
        aria-label="{translate key='Slider'}"
        tabindex="0">
            <div 
                data-max-img-width="{$boxNs->$box_id->width}"
                data-slider-duration="{$boxNs->$box_id->duration|escape}"
                data-slider-delay="{$boxNs->$box_id->delay|escape}"
                data-slider-animation-type="{$boxNs->$box_id->animation|escape}"
                data-slider-auto="{if $boxNs->$box_id->auto}true{else}false{/if}"
                data-slider-nav-type="{$boxNs->$box_id->bullets}"
                class="pageslider row">
                    <ul 
                        class="slides"{if $boxNs->$box_id->height > 0}
                        style="height: {$boxNs->$box_id->height}px;"{/if}
                        aria-live="off">
                        {assign var="images" value=$boxNs->$box_id->images}

                        {foreach from=$images item=slide name="images_loop"}
                            {if $slide->active == '1'}
                                <li 
                                    id="sh-slide-{$slide->id}"
                                    aria-label="{translate key="Slide %s of %s" p1=$slide->id p2=$images|@count}"
                                    data-bg-size-s="{$slide->bg->size1|escape}"
                                    data-bg-size-e="{$slide->bg->size2|escape}"
                                    data-image="{$slide->bg->src|escape}"
                                    data-color-start="{$slide->bg->color1}"
                                    data-color-end="{$slide->bg->color2}"
                                    data-href="{$slide->href|escape}"
                                    data-orientation="{$slide->bg->orientation|escape}"
                                    {if !$smarty.foreach.images_loop.first}
                                        aria-hidden="true"
                                    {/if}
                                    {if $slide->href && !$slide->img->src}
                                        role="link"
                                        aria-label="{translate key='Click to open the slide link'}"
                                        {if $smarty.foreach.images_loop.first}
                                            tabindex="0"
                                        {/if}
                                    {else}
                                        role="tabpanel"
                                    {/if}
                                    role-description="{translate key='Slide'}">
                                        {if $slide->img->src}
                                            <a 
                                                class="slider-img"
                                                href="{$slide->href|escape}"
                                                {if $slide->href}
                                                    aria-label="{translate key='Click to open the slide link'}"
                                                {/if}
                                                title="{$slide->name}"
                                                {if $slide->href && $smarty.foreach.images_loop.first}
                                                    tabindex="0"
                                                {else}
                                                    tabindex="-1"
                                                    aria-hidden="true"
                                                {/if}>
                                                    <img 
                                                        data-align="{$slide->img->pos}"
                                                        data-animation="{$slide->img->anim}"
                                                        data-duration="{$slide->img->time}"
                                                        src="{imageUrl type='boxesGfx' image=$slide->img->src}"
                                                        alt="{$slide->name}" />
                                            </a>
                                        {/if}

                                        {if $slide->text->html}
                                            <div 
                                                data-align="{$slide->text->pos}"
                                                data-animation="{$slide->text->anim}"
                                                data-duration="{$slide->text->time}"
                                                class="slider-text">
                                                    {$slide->text->html|base64_decode}
                                            </div>
                                        {/if}
                                </li>
                            {/if}
                        {/foreach}
                    </ul>
            </div>
    </div>
{/if}
