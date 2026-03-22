                    <div class="box" id="box_newsletter">
                        <div class="boxhead">
                            <span><img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">{$boxNs->$box_id->title|escape}</span>
                        </div>
                        <div class="innerbox">
                            {if $boxNs->$box_id->text}<h5 class="boxintro" id="newsletter_info">{$boxNs->$box_id->text}</h5>{/if}
                            <form action="{route key='newsletterSign' full=true ssl=true}" method="post">
                                <fieldset class="newsletter-input-container js__focus-container">
                                    {include file='formantispam.tpl'}

                                    <input 
                                        type="text"
                                        name="email"
                                        value=""
                                        placeholder="{translate key='Enter your e-mail address'}"
                                        class="newsletter-input js__handle-focus"
                                        {if !$boxNs->$box_id->text} 
                                            aria-label="{translate key="Newsletter"}, {translate key='Enter your e-mail address'}"
                                        {else}
                                            aria-labelledby="newsletter_info"
                                        {/if}>

                                    <button 
                                        type="submit" 
                                        class="btn btn-red"
                                        aria-label="{translate key="Subscribe"}">
                                            <img src="{baseDir}/libraries/images/1px.gif" alt="" class="px1">
                                            <span>{translate key="Subscribe"}</span>
                                    </button>

                                    {$boxNs->$box_id->recaptcha}
                                </fieldset>

                                <fieldset>
                                    {$boxNs->$box_id->legal_notes}
                                </fieldset>
                            </form>
                        </div>
                    </div>
