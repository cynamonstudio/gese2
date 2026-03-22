{foreach from=$product->files item=file}
    {if $file->type == constant('Logic_ProductFile::TYPE_PRODUCT_SAFETY')}
        {append var="safetyFiles" value=$file}
    {/if}
{/foreach}

{if count($product->gpsrCertificates) > 0 || $product->gpsrProducer || $product->gpsrResponsible || $product->gpsrImporter || (isset($safetyFiles) && $safetyFiles|@count > 0)}
    <div class="box tab" id="box_productsafety" tabindex="-1">
        <div class="boxhead tab-head">
            <h3>
                <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                {translate key="Safety"}
            </h3>
        </div>

        <div class="innerbox product-safety">
            {if count($product->gpsrCertificates) > 0 }
                <aside class="r--spacing-s">
                    <h4><strong>{translate key="Certificates and safety warnings"}</strong></h4>

                    <ul class="list">
                        {foreach from=$product->gpsrCertificates item=certificate}
                            <li class="list__content_disc">{$certificate->translation->description}</li>
                        {/foreach}
                    </ul>
                </aside>
            {/if}

            {if $product->gpsrProducer}
                <aside class="r--spacing-s">
                    <h4><strong>{translate key="Manufacturer"}</strong></h4>

                    <p class="r--spacing-xs">
                        <strong>{$product->gpsrProducer->producer->name|escape}</strong><br />
                        {$product->gpsrProducer->producer->street1|escape}<br />
                        {if $product->gpsrProducer->producer->street2}{$product->gpsrProducer->producer->street2|escape}<br />{/if}
                        {$product->gpsrProducer->producer->postcode|escape} {$product->gpsrProducer->producer->city|escape}, {$product->gpsrProducer->producer->country|escape}<br />
                    </p>

                    <p>
                        {if $product->gpsrProducer->producer->email }{$product->gpsrProducer->producer->email|escape}{/if}
                        {if $product->gpsrProducer->producer->email && $product->gpsrProducer->producer->phone}<br />{/if}
                        {if $product->gpsrProducer->producer->phone}{$product->gpsrProducer->producer->phone|escape}{/if}
                        {feature name="dev_gpsr_contact_form_url"}
                            {if $product->gpsrProducer->producer->contact_form_url}
                                <br />
                                <a
                                    class="safety-contact-form-link"
                                    href="{$product->gpsrProducer->producer->contact_form_url|escape}"
                                    title="{translate key='Report a product safety issue'}. {translate key='The form on the manufacturer\'s website will open in a new tab'}."
                                    aria-label="{translate key='Report a product safety issue'}. {translate key='The form on the manufacturer\'s website will open in a new tab'}."
                                    target="_blank"
                                    rel="noopener noreferrer"
                                >
                                    {translate key="Report a product safety issue"}
                                </a>
                            {/if}
                        {/feature}
                    </p>
                </aside>
            {/if}

            {if $product->gpsrResponsible}
                <aside class="r--spacing-s">
                    <h4><strong>{translate key="Responsible person in the EU"}</strong></h4>

                    <p class="r--spacing-xs">
                        <strong>{$product->gpsrResponsible->responsible->name|escape}</strong><br />
                        {$product->gpsrResponsible->responsible->street1|escape}<br />
                        {if $product->gpsrResponsible->responsible->street2}{$product->gpsrResponsible->responsible->street2|escape}<br />{/if}
                        {$product->gpsrResponsible->responsible->postcode|escape} {$product->gpsrResponsible->responsible->city|escape}, {$product->gpsrResponsible->responsible->country|escape}<br />
                    </p>

                    <p>
                        {if $product->gpsrResponsible->responsible->email }{$product->gpsrResponsible->responsible->email|escape}{/if}
                        {if $product->gpsrResponsible->responsible->email && $product->gpsrResponsible->responsible->phone}<br />{/if}
                        {if $product->gpsrResponsible->responsible->phone}{$product->gpsrResponsible->responsible->phone|escape}{/if}
                        {feature name="dev_gpsr_contact_form_url"}
                            {if $product->gpsrResponsible->responsible->contact_form_url}
                                <br />
                                <a
                                    class="safety-contact-form-link"
                                    href="{$product->gpsrResponsible->responsible->contact_form_url|escape}"
                                    title="{translate key='Report a product safety issue'}. {translate key='The form on the manufacturer\'s website will open in a new tab'}."
                                    aria-label="{translate key='Report a product safety issue'}. {translate key='The form on the manufacturer\'s website will open in a new tab'}."
                                    target="_blank"
                                    rel="noopener noreferrer"
                                >
                                    {translate key="Report a product safety issue"}
                                </a>
                            {/if}
                        {/feature}
                    </p>
                </aside>
            {/if}

            {if $product->gpsrImporter}
                <aside class="r--spacing-s">
                    <h4><strong>{translate key="Importer"}</strong></h4>

                    <p class="r--spacing-xs">
                        <strong>{$product->gpsrImporter->importer->name|escape}</strong><br />
                        {$product->gpsrImporter->importer->street1|escape}<br />
                        {if $product->gpsrImporter->importer->street2}{$product->gpsrImporter->importer->street2|escape}<br />{/if}
                        {$product->gpsrImporter->importer->postcode|escape} {$product->gpsrImporter->importer->city|escape}, {$product->gpsrImporter->importer->country|escape}<br />
                    </p>

                    <p>
                        {if $product->gpsrImporter->importer->email }{$product->gpsrImporter->importer->email|escape}{/if}
                        {if $product->gpsrImporter->importer->email && $product->gpsrImporter->importer->phone}<br />{/if}
                        {if $product->gpsrImporter->importer->phone}{$product->gpsrImporter->importer->phone|escape}{/if}
                    </p>
                </aside>
            {/if}

            {if isset($safetyFiles) && $safetyFiles|@count > 0}
                <div class="productfiles">
                    <h5 class="">{translate key="Files to download"}:</h5>
                    <ul class="productfiles">
                        {foreach from=$safetyFiles item=file}
                            <li>
                                <a
                                    href="{route key='productFile' name=$file->name file=$file->file_name}"
                                    title="{if $file->description}{$file->description|escape}{else}{$file->name|escape}{/if}"
                                    class="spanhover">
                                        <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                        <span>{if $file->description}{$file->description|escape}{else}{$file->name|escape}{/if}</span>
                                </a>
                            </li>
                        {/foreach}
                    </ul>
                </div>
            {/if}
        </div>
    </div>
{/if}
