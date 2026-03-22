<div class="productimg f-grid-6{if $visibility.gallery_and_name_gray} product_inactive{/if}">
    <script>
         console.log('21');
    </script>
    {* Sprawdzanie czy produkt ma pliki video *}
    <script>
        // console.log('DEBUG: Liczba plików:', '{$product->files|@count}');
    </script>
    {assign var=hasVideoFile value=false}
    {assign var=thumbFile value=false}
    {assign var=startFrameFile value=false}
    {if $product->files|@count}
        {foreach from=$product->files item=file}
            <script>
                // console.log('DEBUG: Sprawdzam plik:', '{$file->name}');
            </script>
            {if strpos($file->name, '.mp4') !== false || strpos($file->name, '.webm') !== false || strpos($file->name, '.mov') !== false}
                <script>
                    // console.log('DEBUG: ZNALEZIONO VIDEO!');
                </script>
                {assign var=hasVideoFile value=true}
                {assign var=videoFile value=$file}
            {/if}
            {if strpos($file->name, 'thumb.jpg') !== false || strpos($file->name, 'thumb.JPG') !== false}
                {assign var=thumbFile value=$file}
            {/if}
            {if strpos($file->name, 'frame.jpg') !== false || strpos($file->name, 'frame.JPG') !== false}
                {assign var=startFrameFile value=$file}
            {/if}
        {/foreach}
    {/if}
    <script>
        // console.log('DEBUG: Wszystkie pliki produktu:');
        {if $product->files|@count}
            {foreach from=$product->files item=file}
            // console.log('  - {$file->name}');
            {/foreach}
        {else}
        // console.log('  BRAK PLIKÓW');
        {/if}
    </script>
    
    <div class="mainimg productdetailsimgsize row" style="opacity: 0;">
        {* Obrazki - zawsze w DOM *}
        {if count($galleryGfxs)}
            {assign var=img value=$galleryGfxs.0}
        {/if}

        {if 1 == count($galleryGfxs)}
            <a 
                id="prodimg{$img->getIdentifier()}"
                href="{imageUrl type='productGfx' image=$img->gfx->unic_name}"
                title="{$img->translation->name|escape}"
                {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_OLD')}
                    data-gallery="true"
                    data-gallery-list="{$product->translation->name|escape}"
                {else}
                    class="js__gallery-anchor-image"
                {/if}
                {if $img}
                    aria-label="{$img->getAccessibilityDesc()} {translate key='Press Enter or Space to open the selected photo in fullscreen view.'}"
                {/if}
            >
                    <link 
                        itemprop="image" 
                        href="{imageUrl type='productGfx' image=$img->gfx->unic_name}" />

                    <img 
                        class="photo {if 1 == (int) $skin_settings->productdetails->productzoom}innerzoom {elseif 2 == (int) $skin_settings->productdetails->productzoom}outerzoom {/if} {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_NEW')}js__open-gallery {/if}" 
                        src="{imageUrl type='productGfx' width=$skin_settings->img->big height=$skin_settings->img->big image=$img->gfx->unic_name}"
                        width="{imageWidth gfx=$img thumbnailSize=$skin_settings->img->big}"
                        height="{imageHeight gfx=$img thumbnailSize=$skin_settings->img->big}"
                        alt="{$img->translation->name|escape}"
                        {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_NEW')}
                            data-gallery-name="productGallery"
                            data-image-description="{$img->translation->name|escape}"
                            data-image-announcement="{$img->getAccessibilityDesc()}" 
                        {/if} />
            </a>
        {else}
            <img 
                class="photo {if 1 == (int) $skin_settings->productdetails->productzoom}innerzoom {elseif 2 == (int) $skin_settings->productdetails->productzoom}outerzoom {/if}productimg {if $product->defaultStock->mainImageId()} gallery_{$product->defaultStock->mainImageId()}{/if} {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_NEW')}js__open-gallery {/if}" 
                src="{imageUrl type='productGfx' width=$skin_settings->img->big height=$skin_settings->img->big image=$product->defaultStock->mainImageName() overlay=1}"
                width="{imageWidth gfx=$img thumbnailSize=$skin_settings->img->big}"
                height="{imageHeight gfx=$img thumbnailSize=$skin_settings->img->big}"
                alt="{$img->translation->name|escape}"
                tabindex="0"
                {if $img}
                    aria-label="{$img->getAccessibilityDesc()} {translate key='Press Enter or Space to open the selected photo in fullscreen view.'}"
                {/if}
                {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_NEW')}
                    data-gallery-name-to-open="productGallery" 
                {/if} />
        {/if}

        {if $product->specialOffer || $product->isNew()}
            <ul class="tags">
                {if $product->specialOffer}
                    <li class="promo">
                        {translate key="on sale tag"}
                    </li>
                {/if}

                {if $product->isNew()}
                    <li class="new">
                        {translate key="new product tag"}
                    </li>
                {/if}
            </ul>
        {/if}
        {if $hasVideoFile}
        <div id="CustomStage" class="video-overlay-stage">
            <div class="video-group">
                <div id="custom-video-container" class="video-container">
                    <div id="custom-start-frame" class="start-frame"></div>
                    <div class="gradient-bar"></div>
                </div>
            </div>
            <div id="custom-drag-container" class="drag-container">
                <div class="drag-line"></div>
                <button 
                    type="button" 
                    id="custom-drag-this" 
                    class="drag-this" 
                    aria-label="{translate key='Drag to scrub the video'}">
                </button>
            </div>
        </div>
        {/if}
    </div>

    {* Skrypty i style dla video overlay - CustomStage jest już wewnątrz .mainimg *}
    {if $hasVideoFile}
        <script>
            // console.log('DEBUG: Renderuję Custom Stage!');
        </script>
        {* GSAP z CDN *}
        <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js" onload="void 0"></script>
        {* Draggable z CDN *}
        <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/Draggable.min.js" onload="void 0"></script>
        {* Usuń focus po kliknięciu *}
        <script>
        {literal}
        (function(){
            var mainImg = document.querySelector('.mainimg.productdetailsimgsize.row');
            if (mainImg) {
                mainImg.addEventListener('mousedown', function(e) {
                    e.preventDefault();
                });
                mainImg.addEventListener('mouseup', function(e) {
                    this.blur();
                    if (document.activeElement) {
                        document.activeElement.blur();
                    }
                });
                mainImg.addEventListener('click', function(e) {
                    this.blur();
                    if (document.activeElement) {
                        document.activeElement.blur();
                    }
                });
            }
        })();
        {/literal}
        </script>
        <style>
        {literal}
            .productimg.f-grid-6 {
                position: relative;
            }
            .mainimg.productdetailsimgsize.row {
                position: relative;
                outline: none !important;
                border: none !important;
                box-shadow: none !important;
                opacity: 0;
                transition: opacity 0.3s ease;
            }
            .mainimg.productdetailsimgsize.row:focus,
            .mainimg.productdetailsimgsize.row:active,
            .mainimg.productdetailsimgsize.row:focus-visible,
            .mainimg.productdetailsimgsize.row:focus-within {
                outline: none !important;
                border: none !important;
                box-shadow: none !important;
            }
            .mainimg.productdetailsimgsize.row * {
                outline: none !important;
            }
            .mainimg.productdetailsimgsize.row *:focus,
            .mainimg.productdetailsimgsize.row *:active,
            .mainimg.productdetailsimgsize.row *:focus-visible {
                outline: none !important;
                border: none !important;
                box-shadow: none !important;
            }
            .video-overlay-stage {
                position: absolute !important;
                top: 0 !important;
                left: 0 !important;
                width: 100% !important;
                height: 100% !important;
                z-index: 2 !important;
                pointer-events: auto;
            }
            .video-group {
                position: absolute;
                inset: 0;
                width: 100%;
                height: 100%;
                top:0px;
                left:0px;
                overflow:hidden;
                filter: grayscale(0)
            }
            .video-container {
                position: relative;
                width: 100%;
                height: 191.94%;
                padding: 0px !important;
            }
            .start-frame {
                position: relative;
                width: 100%;
                height: 100%;
                background-size: cover;
                background-position: center;
              
            }
            .video-overlay-stage video#custom-video {
                position: absolute;
                inset: 0;
                width: 100%;
                height: auto;
                z-index: 1000;
            }
            .video-overlay-stage .gradient-bar {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
                height: 8px;
                background: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0.6) 50%, rgba(255,255,255,0) 100%);
                pointer-events: none;
            }
            .drag-container {
                position: absolute;
                bottom: 5px;
                left: 0;
                width: 100%;
                height: 36px;
                z-index: 1010;
            }
            .drag-line {
                position: absolute;
                width: 90%;
                height: 50%;
                top: 0px;
                left: 5%;
                border-bottom:1px solid #d1a737;
                z-index: 0;
            }
            .drag-this {
                position: relative;
                width: 36px;
                height: 36px;
                cursor: pointer;
                border-radius: 50%;
                background: #d1a737;
                appearance: none;
                border: none;
                opacity: 1 !important;
                visibility: visible !important;
                display: block !important;
                z-index: 2;
            }
            .thumb-play-icon-st0 {
                fill: #D1A737;
            }
            .thumb-play-icon-st1 {
                fill: #FFFFFF;
            }
        {/literal}
        </style>
        
        <script>
        {literal}
        // Ustaw opacity: 0 dla mainimg na SAMYM początku - przed wszystkim
        (function(){
            var mainImgContainer = document.querySelector('.mainimg.productdetailsimgsize.row');
            if (mainImgContainer) {
                mainImgContainer.style.opacity = '0';
            }
        })();
        
        (function(){
            // Zabezpieczenie przed podwójnym ładowaniem
            if (window.customVideoStageInitialized) {
                // console.log('DEBUG: CustomStage już zainicjalizowany, POMIJAM');
                return;
            }
            window.customVideoStageInitialized = true;
            // console.log('DEBUG: Inicjalizuję CustomStage');
            
            var stage = document.getElementById("CustomStage");
            if (!stage) {
                return;
            }
            
            // Pobierz mainimg container (jeśli nie został już ustawiony na początku)
            var mainImgContainer = document.querySelector('.mainimg.productdetailsimgsize.row');
            {/literal}
            var hasVideo = {$hasVideoFile};
            var src = "{if $videoFile}{route key='productFile' name=$videoFile->name file=$videoFile->file_name}{/if}";
            {literal}
            
            var startFrame = document.getElementById("custom-start-frame");
            if (!startFrame) {
                return;
            }
            
            startFrame.style.width = '100%';
            startFrame.style.height = 'auto';
            
            // Ustaw frame.jpg jako background-image
            {/literal}
            {if $startFrameFile}
             var startFrameUrl = "{route key='productFile' name=$startFrameFile->name file=$startFrameFile->file_name}";
            {else}
            var startFrameUrl = null;
            {/if}
            {literal}
            
            if (startFrameUrl) {
                // console.log('DEBUG: Znaleziono frame.jpg:', startFrameUrl);
               // startFrame.style.backgroundImage = 'url(' + startFrameUrl + ')';
                startFrame.style.backgroundSize = 'cover';
                startFrame.style.backgroundPosition = 'center';
                startFrame.style.backgroundRepeat = 'no-repeat';
            } else {
                // console.log('DEBUG: frame.jpg nie znaleziony');
            }
            
            var animId;
            var time = 0;
            var lastFrameTime = 0;
            var fps = 24;
            var frameDuration = 1000 / fps;
            var dir = 1; // 1 = do przodu, -1 = wstecz
            var userInteracted = false;
            var animaIdStopped = false;
            
            var dragThis = document.getElementById("custom-drag-this");
            var dragContainer = document.getElementById("custom-drag-container");
            var dragLine = document.querySelector('#custom-drag-container .drag-line');
            var videoContainer = document.getElementById("custom-video-container");
            var dragStartX = 0;
            
            if (!dragThis || !dragContainer || !videoContainer) {
                return;
            }
            gsap.set(dragContainer, { autoAlpha: 0 });
            
            // Dodaj SVG path do kółka dragthis
            var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
            svg.setAttribute('width', '60%');
            svg.setAttribute('height', '60%');
            svg.setAttribute('viewBox', '0 0 100 100');
            svg.style.position = 'absolute';
            svg.style.top = '50%';
            svg.style.left = '50%';
            svg.style.transform = 'translate(-50%, -50%)';
            svg.style.pointerEvents = 'none';
            
            var path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
            path.setAttribute('class', 'svg-path');
            path.setAttribute('d', 'M40.94,103.29c0-31.69,0-63.39,0-95.08,0-4.13,2.25-7.18,5.86-8.01,4.65-1.07,9.07,2.28,9.26,7.05.05,1.38.02,2.76.02,4.14,0,21.19,0,42.38,0,63.57,0,1.6.36,2.99,1.82,3.85,1.4.83,2.84.91,4.25,0,1.42-.93,1.75-2.32,1.75-3.91-.02-9.24-.06-18.49.01-27.73.04-6.01,6.34-9.59,11.41-6.54,2.66,1.6,3.73,4.08,3.73,7.13,0,10.08.07,20.17.01,30.25-.02,3.57,3.2,5.04,5.41,3.96,1.77-.87,2.31-2.43,2.31-4.32-.03-7.08,0-14.16-.02-21.24,0-3.37,1.35-5.95,4.43-7.42,4.7-2.24,10.16.9,10.65,6.09.07.71.07,1.44.07,2.16.02,7.44.03,14.88.05,22.32,0,2.63,1.43,4.27,3.76,4.33,2.33.06,3.94-1.69,3.96-4.37.02-4.02,0-8.04,0-12.06.02-4.66,3.27-8.1,7.61-8.07,4.29.03,7.52,3.41,7.53,7.98.02,19.99.08,39.98-.02,59.96-.1,19.97-16.43,36.12-36.4,36.08-5.87-.01-11.81.14-17.59-.71-9.49-1.4-17.06-6.46-22.79-14.16-5.52-7.41-10.9-14.92-16.5-22.27-7.03-9.23-15.96-16.58-24.42-24.4-1.98-1.83-4-3.63-5.86-5.59-1.69-1.78-1.62-3.05-.1-4.93,3.84-4.76,10.38-5.66,15.28-2.14,7.6,5.46,15.21,10.91,22.82,16.36.43.31.88.59,1.68,1.14,0-1.39,0-2.4,0-3.4Z');
            path.setAttribute('fill', 'white');
            path.style.transform = 'scale(0.6) translateX(14%)';
            svg.appendChild(path);
            dragThis.appendChild(svg);
            
            // Ustaw frame.jpg jako background-image dla custom-video-container
            {/literal}
            {if $startFrameFile}
            var videoContainerBgUrl = "{route key='productFile' name=$startFrameFile->name file=$startFrameFile->file_name}";
            {else}
            var videoContainerBgUrl = null;
            {/if}
            {literal}
            
            if (videoContainerBgUrl) {
                // console.log('DEBUG: Ustawiam frame.jpg jako background dla custom-video-container:', videoContainerBgUrl);
                videoContainer.style.backgroundImage = 'url(' + videoContainerBgUrl + ')';
                videoContainer.style.backgroundPosition = 'top left';
                videoContainer.style.backgroundSize = '100% auto';
                videoContainer.style.backgroundRepeat = 'no-repeat';
            } else {
                // console.log('DEBUG: frame.jpg nie znaleziony dla custom-video-container');
            }
            
            var element = document.createElement("video");
            element.setAttribute("id", "custom-video");
            element.style.opacity = 1;
            element.style.position = "absolute";
            element.style.top = "0px";
            element.style.left = "0px";
            element.style.width = "100%";
            element.style.height = "auto";
            element.style.zIndex = 1002;
            

      
            startFrame.appendChild(element);
            
            var video = document.getElementById("custom-video");
            var videoObjectUrl = null;
            video.muted = true;
            video.loop = false;
            video.controls = false;
            video.setAttribute("playsinline", "playsinline");
            video.autoplay = false;
            
            video.style.borderRadius = "0";
            video.style.overflow = "hidden";
            
            fetch(src, { credentials: 'same-origin' })
                .then(function(r) {
                    if (!r.ok) throw new Error('HTTP ' + r.status);
                    return r.blob();
                })
                .then(function(blob) {
                    if (videoObjectUrl) URL.revokeObjectURL(videoObjectUrl);
                    videoObjectUrl = URL.createObjectURL(blob);
                    video.src = videoObjectUrl;
                    video.load();
                })
                .catch(function(err) {
                    console.error('Video load failed:', err);
                });
           
            
            var dragElWidth = parseInt(window.getComputedStyle(dragThis).width);
            var containerWidth = parseInt(window.getComputedStyle(dragContainer).width);
            var scrollWidth = containerWidth - dragElWidth;
            
            var dur = 0;
            var track;

            var pulseTl = gsap.timeline({
                paused: true,
                repeat: -1,
                defaults: { ease: "power1.inOut" }
            });
            pulseTl.to(dragThis, { scale: 1.0, duration: 0.6 })
                   .to(dragThis, { scale: 1.0, duration: 0.6 });

            function resetToStart() {
                if (video) {
                    video.pause();
                    video.currentTime = 0;
                    time = 0;
                    dir = 1;
                }
                if (dragThis) {
                    if (!isNaN(dragStartX)) {
                        gsap.set(dragThis, { x: dragStartX, scale: 1 });
                    } else {
                        gsap.set(dragThis, { x: 0, scale: 1 });
                    }
                }
                if (draggable) {
                    draggable.update();
                }
            }
            
            // Sprawdź czy GSAP i Draggable są dostępne
            if (typeof gsap === 'undefined' || typeof Draggable === 'undefined') {
                console.error('GSAP lub Draggable nie są załadowane!');
                return;
            }
            
            var draggableBounds = dragLine || dragContainer;
            var draggable = Draggable.create(dragThis, {
                type: "x",
                force3D: false,
                bounds: draggableBounds,
                onPress: function (e) {
                    if (e) {
                        e.preventDefault();
                        e.stopPropagation();
                    }
                    cancelAnimationFrame(animId);
                    animaIdStopped = true;
                    userInteracted = true;
                    video.pause();
                },
                onDrag: function (e) {
                    if (e) {
                        e.preventDefault();
                        e.stopPropagation();
                    }
                    cancelAnimationFrame(animId);
                    userInteracted = true;
                    video.pause();
                    var x = Math.floor(this.x);
                    var perc = scrollWidth > 0 ? x / scrollWidth : 0;
                    if (dur) {
                        video.currentTime = parseFloat(perc.toFixed(2)) * (0.97 * dur);
                    }
                },
                onDragEnd: function (e) {
                    if (e) {
                        e.preventDefault();
                        e.stopPropagation();
                    }
                    // Po interakcji nie wznawiamy animacji
                }
            })[0];
            if (draggable) {
                dragStartX = !isNaN(draggable.minX) ? draggable.minX : 0;
                gsap.set(dragThis, { x: dragStartX });
                draggable.update();
            }
            
            function updateScrubberBounds() {
                dragElWidth = parseInt(window.getComputedStyle(dragThis).width, 10) || 0;
                containerWidth = parseInt(window.getComputedStyle(dragContainer).width, 10) || 0;
                scrollWidth = Math.max(0, containerWidth - dragElWidth);
                if (draggable) {
                    draggable.applyBounds();
                    dragStartX = !isNaN(draggable.minX) ? draggable.minX : dragStartX;
                    draggable.update();
                }
                if (dur > 0 && scrollWidth >= 0) {
                    gsap.set(dragThis, { x: (video.currentTime / dur) * scrollWidth });
                }
            }
            
            // Zablokuj kliknięcie na mainimg gdy jest video overlay (używamy już zdefiniowanego mainImgContainer)
            if (mainImgContainer && stage) {
                // Usuń handler kliknięcia z main.js
                if (typeof $ !== 'undefined') {
                    $(mainImgContainer).off('click');
                }
            }
            
            video.addEventListener("canplaythrough", function() {
                dur = video.duration;
                
                // Pokaż mainimg po załadowaniu video - animacja GSAP
                if (mainImgContainer) {
                    // console.log('DEBUG: Video załadowane - animuję mainimg');
                    gsap.to(mainImgContainer, { 
                        opacity: 1, 
                        duration: 0.2, 
                        ease: "none" 
                    });
                }
                if (dragContainer) {
                    gsap.to(dragContainer, { autoAlpha: 1, duration: 0.2, overwrite: true });
                }
                
                track = function(now) {
                    if (userInteracted) return;
                    if (stage && stage.style.display === 'none') return;
                    
                    if (now - lastFrameTime >= frameDuration) {
                        time += (1 / fps) * dir;
                        time = Math.round(time * 10000) / 10000;
                        if (time >= 0.98 * dur) {
                            time = 0.98 * dur;
                            dir = -1;
                        } else if (time <= 0) {
                            time = 0;
                            dir = 1;
                        }
                        video.currentTime = time;
                        var percent = time / dur;
                        gsap.set(dragThis, { x: percent * scrollWidth });
                        lastFrameTime = now;
                    }
                    animId = requestAnimationFrame(track);
                };
                
                if (!userInteracted) {
                    animaIdStopped = false;
                    animId = requestAnimationFrame(track);
                }
            });
            
            window.addEventListener("resize", updateScrubberBounds);
            if (window.visualViewport) {
                window.visualViewport.addEventListener("resize", updateScrubberBounds);
            }
            
            // Zatrzymaj/wznów animację gdy window jest hidden/visible
            document.addEventListener('visibilitychange', function() {
                if (document.hidden) {
                    cancelAnimationFrame(animId);
                    resetToStart();
                    pulseTl.progress(0).play();
                } else {
                    pulseTl.progress(0).play();
                    // Nie restartujemy animacji automatycznie po powrocie
                }
            });
            
            // Ukryj video overlay przy interakcji z miniaturkami - po załadowaniu DOM
            var setupThumbnailListeners = function() {
                var innerSmallGallery = document.querySelector('.innersmallgallery');

                if (innerSmallGallery && stage) {
                    var hideVideoOverlay = function(e) {
                        // console.log('DEBUG: hideVideoOverlay wywołane!', e.type, e.target);
                        if (stage) {
                            if (typeof gsap !== 'undefined') gsap.killTweensOf(stage);
                            stage.style.display = 'none';
                            cancelAnimationFrame(animId);
                        } else {
                            // console.log('DEBUG: stage nie istnieje!');
                        }
                    };
                    
                    var showVideoOverlay = function(e) {
                        if (e && (e.type === 'click' || e.type === 'keydown')) {
                            e.preventDefault();
                            e.stopPropagation();
                        }
                        if (stage) {
                            stage.style.display = '';
                            gsap.set(stage, { opacity: 0 });
                            gsap.to(stage, { opacity: 1, delay: 0.1, duration: 0.25, overwrite: true });
                            requestAnimationFrame(function() {
                                if (typeof updateScrubberBounds === 'function') updateScrubberBounds();
                            });
                        }
                    };
                    
                    function showVideoOverlayAndStartFromZero(e) {
                        showVideoOverlay(e);
                        if (typeof resetToStart === 'function') resetToStart();
                        animaIdStopped = false;
                        userInteracted = false;
                        lastFrameTime = 0;
                        if (typeof track === 'function' && video && dur > 0) {
                            animId = requestAnimationFrame(track);
                        }
                    }
                    
                    var thumbImg = innerSmallGallery.querySelector('img.thumb-video-trigger');
                    if (thumbImg) {
                        thumbImg.addEventListener('click', showVideoOverlayAndStartFromZero);
                        thumbImg.addEventListener('mouseenter', showVideoOverlayAndStartFromZero);
                        thumbImg.addEventListener('keydown', function(e) {
                            if (e.key === 'Enter' || e.key === ' ') {
                                e.preventDefault();
                                showVideoOverlayAndStartFromZero(e);
                            }
                        });
                    }
            
                    var galleryImages = innerSmallGallery.querySelectorAll('li');
                    [].forEach.call(galleryImages, function(li) {
                        if (thumbImg && li.contains(thumbImg)) return;
                        li.addEventListener('click', hideVideoOverlay);
                        li.addEventListener('mouseenter', hideVideoOverlay);
                    });
                } else {
                    // console.log('DEBUG: innerSmallGallery lub stage nie istnieje!');
                }
            };
            
            // Sprawdź czy DOM jest już załadowany
            if (document.readyState === 'loading') {
                document.addEventListener('DOMContentLoaded', setupThumbnailListeners);
            } else {
                // DOM już załadowany, wywołaj od razu
                setupThumbnailListeners();
            }
            
            window.addEventListener('beforeunload', function() {
                if (videoObjectUrl) URL.revokeObjectURL(videoObjectUrl);
            });
            window.addEventListener('pagehide', function() {
                if (videoObjectUrl) URL.revokeObjectURL(videoObjectUrl);
            });
        })();
        {/literal}
        </script>
    {else} {* Blok gdy NIE MA video - po prostu pokaż galerię bez animacji *}
        <script>
        {literal}
        (function(){
            // Pokaż mainimg od razu bez animacji
            var mainImgContainer = document.querySelector('.mainimg.productdetailsimgsize.row');
            if (mainImgContainer) {
                mainImgContainer.style.opacity = '1';
            }
        })();
        {/literal}
        </script>
    {/if} {* Koniec bloku if/else dla hasVideoFile *}
        
    <div class="smallgallery row">
        {if count($galleryGfxs) > 1 && 0 == (int) $skin_settings->productdetails->miniaturesposition}
            <div class="innersmallgallery">
                <ul class="r--l-flex r--l-flex-wrap">
                    {* Thumb.jpg jako pierwszy element *}
                    {if $thumbFile}
                    <li class="r--l-flex r--l-flex-vcenter" style="position: relative;">
                        <img 
                            src="{route key='productFile' name=$thumbFile->name file=$thumbFile->file_name}"
                            style="height: 100%; width: auto; cursor: pointer;"
                            class="thumb-video-trigger"
                            alt="Video thumbnail"
                            tabindex="0"
                            role="button"
                            aria-label="{translate key='Show product video'}"/>
                        <svg style="position: absolute; top: 0; left: 0; transform: translate(-50%, -50%); pointer-events: none;" width="15.6" height="15.2" viewBox="0 0 15.6 15.2">
                            <g>
                                <circle class="thumb-play-icon-st0" cx="7.8" cy="7.6" r="7.1"/>
                                <polygon class="thumb-play-icon-st1" points="10.7,7.6 6.4,5.1 6.4,10.1"/>
                            </g>
                        </svg>
                    </li>
                    {/if}
                    {foreach from=$galleryGfxs item=img name=miniature_image_loop}
                        {assign var=imgId value=$img->getIdentifier()}
                        {assign var=imgNumber value=$smarty.foreach.miniature_image_loop.iteration}

                        {if $img}
                            {assign var=ariaLabelWcagDescription value=$img->getAccessibilityDesc()}
                        {else}
                            {assign var=ariaLabelWcagDescription value=''}
                        {/if}

                        <li class="r--l-flex r--l-flex-vcenter">
                            <a 
                                id="prodimg{$img->getIdentifier()}" 
                                href="{imageUrl type='productGfx' image=$img->gfx->unic_name}" 
                                title="{$img->translation->name|escape}"
                                {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_OLD')}
                                    data-gallery="true"
                                    data-gallery-list="{$product->translation->name|escape}" 
                                {/if}
                                class="gallery {if $img->getIdentifier() == $product->defaultStock->mainImageId()} current{/if} {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_NEW')}js__gallery-anchor-image{/if}"
                                aria-label="{translate key='Thumbnail %s of %s. %s. Press Enter or Space to open the selected photo in fullscreen view.' p0=$imgNumber p1=$galleryGfxs|count p2=$ariaLabelWcagDescription}"
                            >
                                    <link 
                                        itemprop="image" 
                                        href="{imageUrl type='productGfx' image=$img->gfx->unic_name}" />

                                    <img 
                                        src="{imageUrl type='productGfx' width=$skin_settings->img->mini height=$skin_settings->img->mini image=$img->gfx->unic_name}"
                                        width="{imageWidth gfx=$img thumbnailSize=$skin_settings->img->mini}"
                                        height="{imageHeight gfx=$img thumbnailSize=$skin_settings->img->mini}"
                                        alt="{$img->translation->name|escape}" 
                                        data-img-name="{imageUrl type='productGfx' width=$skin_settings->img->big height=$skin_settings->img->big image=$img->gfx->unic_name}"
                                        {if $skin_settings->productdetails->galleryversion == constant('Logic_SkinVariant::GALLERY_NEW')}
                                            class="js__open-gallery" 
                                            data-gallery-name="productGallery"
                                            data-image-description="{$img->translation->name|escape}"
                                            data-image-announcement="{$img->getAccessibilityDesc()}" 
                                        {/if} />
                            </a>
                        </li>
                    {/foreach}
                </ul>

                <nav class="hide">
                    <span
                        class="smallgallery-left none"
                        aria-label="{translate key='Previous thumbnails'}"
                        role="button"
                        tabindex="0"
                    ></span>
                    <span
                        class="smallgallery-right"
                        aria-label="{translate key='Next thumbnails'}"
                        role="button"
                        tabindex="0"
                    ></span>
                </nav>
            </div>
        {/if}
    </div>
</div>