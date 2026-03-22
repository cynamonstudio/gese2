(function(compId){var _=null,y=true,n=false,x1='6.0.0',x13='rgba(130,130,130,0.00)',x3='6.0.0.400',x2='5.0.0',x8='rgba(193,155,155,0)',x11='rgba(0,0,0,0)',x6='rgba(255,255,255,1)',x7='solid',m='rect',x4='both',g='image',x10='rgba(255,255,255,1.00)',x9='rgba(193,155,155,0.00)';var g12='Pasted.svg';var s5="pic";var im='images/',aud='media/',vid='media/',js='js/',fonts={},opts={'gAudioPreloadPreference':'auto','gVideoPreloadPreference':'auto'},resources=[],scripts=[],symbols={"stage":{v:x1,mv:x2,b:x3,stf:x4,cg:x4,rI:n,cn:{dom:[{id:'video_group',t:'group',r:['21px','0px','557px','557px','auto','auto'],userClass:s5,c:[{id:'video_container',t:'group',r:['0%','0%','100%','100%','auto','auto'],overflow:'hidden',c:[{id:'start-frame',t:m,r:['0px','0px','553px','1065px','auto','auto'],f:[x6],s:[0,"rgb(209, 167, 55)",x7]}]},{id:'Rectangle',t:m,r:['0%','99.6%','533px','2px','auto','auto'],f:[x8,[0,[['rgba(255,232,173,1.00)',0],['rgba(209,167,55,1.00)',50],['rgba(255,232,173,1.00)',100]]]],s:[0,"rgb(152, 121, 62)",x7]},{id:'dragThis',t:'ellipse',r:['0%','90.1%','20%','20%','auto','auto'],br:["0%","0%","0%","0% 0%"],f:[x9],s:[0,"rgba(152,121,62,1.00)",x7],c:[{id:'insideDrag',t:'ellipse',r:['0%','21.5%','56.1%','55.1%','auto','auto'],br:["50%","50%","50%","50%"],f:[x10],s:[2,"rgba(209,167,55,1.00)",x7],boxShadow:["",5,3,14,0,"rgba(209,167,55,0.22)"],c:[{id:'icon2',t:g,r:['26.7%','25.4%','38.3%','50.9%','auto','auto'],f:[x11,im+g12,'0px','0px']}]}]}]}],style:{'${Stage}':{isStage:true,r:['null','null','600px','600px','auto','auto'],overflow:'hidden',f:[x13]}}},tt:{d:390,a:y,data:[]}}};AdobeEdge.registerCompositionDefn(compId,symbols,fonts,scripts,resources,opts);})("EDGE-122256529");
(function($,Edge,compId){var Composition=Edge.Composition,Symbol=Edge.Symbol;Edge.registerEventBinding(compId,function($){
//Edge symbol: 'stage'
(function(symbolName){Symbol.bindSymbolAction(compId,symbolName,"creationComplete",function(sym,e){var src="media/vid.mp4"
var frameSrc="media/start-frame.jpg"
var startFrame=document.getElementById("Stage_start-frame")
if(frameSrc)startFrame.style.backgroundImage=`url('${frameSrc}')`;startFrame.style.backgroundRepeat='no-repeat';startFrame.style.backgroundSize='contain';startFrame.style.backgroundPosition='center top';startFrame.style.width='100%';startFrame.style.height='auto';var animId
var time=0
var lastFrameTime=0
var fps=45
var frameDuration=1000/fps
var dir=1
var wait
var dragThis=document.getElementById("Stage_dragThis")
var insideDrag=document.getElementById("Stage_insideDrag")
var videoContainer=document.getElementById("Stage_video_container")
var element=document.createElement("video");element.style.width="100%";element.setAttribute("id","Stage_video");element.style.opacity=1;element.style.position="relative";element.style.zIndex=1002;startFrame.appendChild(element);var video=document.getElementById("Stage_video");video.setAttribute("src",src);video.muted=true;video.loop=true;video.controls=false;video.setAttribute("playsinline","playsinline");video.autoplay=true;video.pause();var dragElWidth=parseInt(window.getComputedStyle(dragThis).width)
var insideElWidth=parseInt(window.getComputedStyle(insideDrag).width)
var scrollWidth=parseInt(window.getComputedStyle(videoContainer).width)-dragElWidth
var insideDistance=dragElWidth-insideElWidth
var draggable=Draggable.create(dragThis,{type:"x",liveSnap:function(endValue){return Math.max(0,Math.min(scrollWidth,endValue))},onPress:function(){cancelAnimationFrame(animId)
if(wait)clearTimeout(wait)},onDrag:function(){cancelAnimationFrame(animId)
var x=Math.floor(this.x)
var perc=x/scrollWidth
console.log(perc)
video.currentTime=perc.toFixed(2)*(.98*dur)
gsap.set(insideDrag,{x:perc.toFixed(2)*insideDistance})},onDragEnd:function(){wait=setTimeout(function(){},3000)}})[0]
var track
video.addEventListener("loadedmetadata",function(){dur=video.duration
track=function(now){if(now-lastFrameTime>=frameDuration){time+=(1/fps)*dir
if(time>=.98*dur){time=.98*dur
dir=-1}else if(time<=0){time=0
dir=1}
video.currentTime=time
var percent=video.currentTime/dur
gsap.set(insideDrag,{x:percent*insideDistance})
gsap.set(dragThis,{x:percent*scrollWidth})
lastFrameTime=now}
animId=requestAnimationFrame(track)}
animId=requestAnimationFrame(track)})});
//Edge binding end
})("stage");
//Edge symbol end:'stage'
})})(AdobeEdge.$,AdobeEdge,"EDGE-122256529");

