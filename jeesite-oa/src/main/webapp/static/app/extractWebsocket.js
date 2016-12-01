/*
 Extract Demo

 extractWebSocket({
 websocketBasePath:'',

 onopen:function(event){

 },
 onmessage:function(event){

 },
 onerror:function(event){

 },
 onclose:function(event){

 }
 });
 */
function extractWebSocket(options) {
    var websocket;
    if ('WebSocket' in window) {
        websocket = new WebSocket(options.websocketBasePath+"/webSocketServer");
    } else if ('MozWebSocket' in window) {
        websocket = new MozWebSocket(options.websocketBasePath+"/webSocketServer");
    } else {
        websocket = new SockJS(options.websocketBasePath+"/sockjs/webSocketServer");
    }
    websocket.onopen=function (event) {
        console.log('Info: connection opened.');
        if (options.onopen && $.isFunction(options.onopen)) {
            options.onopen(event);
        }
    };
    websocket.onmessage=function (event) {
        if (options.onmessage && $.isFunction(options.onmessage)) {
            options.onmessage(event);
        }
    };

    websocket.onerror=function (event) {
        console.log('Info: connection error.'+event);
        if (options.onerror && $.isFunction(options.onerror)) {
            options.onerror(event);
        }
    };
    websocket.onclose=function (event) {
        console.log('Info: connection closed.'+event);
        if (options.onclose && $.isFunction(options.onclose)) {
            options.onclose(event);
        }
    };
}
