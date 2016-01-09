/*
 * Copyright (c) 2012-2014, Veritrans Indonesia and/or its affiliates. All rights reserved.
 * VERITRANS INDONESIA PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

// RED configuration
var io_enable_rip = true;     // collect Real IP information
var io_install_flash = false; // do not install Flash
var io_install_stm = false;   // do not require install of Active X
var io_exclude_stm = 12;      // do not run Active X under IE 8 platforms

/**
 * Callback for RED device id
 * @param bb
 * @param isComplete
 */
var io_bb_callback = function (bb, isComplete) {
    if (isComplete) {
        Veritrans.device_id = bb;
    }
}

/**
 * Veritrans JavaScript Client
 */
var Veritrans = (function () {

    /**
     * callback function from merchant
     */
    var vtCallback = function() {};

    /**
     * token request from merchant
     */
    var vtRequest;

    /**
     * Convert from token request object to query string
     * @param {Object} tokenRequest
     * @returns {string} query string
     */
    function toQueryParam(tokenRequest) {
        var query = '?';
        var encode = encodeURIComponent;
        for (var property in tokenRequest) {
            if (tokenRequest.hasOwnProperty(property)) {
                query += encode(property) + '=' + encode(tokenRequest[property]) + '&';
            }
        }
        return query;
    }

    /**
     * Process JSONP url, this method add script tag to body to process JSONP
     * @param url JSONP url
     */
    function processJsonP(url) {
        var s = document.createElement('script');
        s.src = url;
        document.getElementsByTagName('head')[0].appendChild(s);
    }

    /**
     * Process token request from merchant
     * @param {function} tokenRequest
     * @param {function} callbackFunction
     * @param {boolean} isTwoClick
     */
    function processToken(tokenRequest, callbackFunction, isTwoClick) {
        // add validation here if needed, before send to url endpoint

        vtCallback = callbackFunction;
        vtRequest = tokenRequest();

        if (isTwoClick) {
            // if two_click transaction, add parameter two_click
            vtRequest.two_click = 'true';
        } else {
            // id 3dsecure transaction add secure_callback
            vtRequest.secure_callback = 'Veritrans.c';
        }

        vtRequest.callback = 'Veritrans.c';
        vtRequest.client_key = Veritrans.client_key;

        // return false if invalid
        return true;
    }

    function appendRedirectUrl(response){
        if(response.redirect_url){
            response.redirect_url += toQueryParam(vtRequest);
        }
        return response;
    }

    /**
     * Callback for postMessage
     * @param event
     */
    function receiveMessage(event) {
        if (event.data) {
            Veritrans.c(event.data);
        }
    }

    // add event listener
    if (window.addEventListener) {
        window.addEventListener("message", receiveMessage, false);
    } else {
        // for IE6 - IE10
        window.attachEvent("onmessage", receiveMessage);
    }

    return {

        /**
         * Device id for RED
         */
        device_id: "",

        /**
         * Payment API token url, change it to change the endpoint
         * for sandbox, use https://api.sandbox.veritrans.co.id/v2/token
         */
        url: 'https://api.veritrans.co.id/v2/token',

        /**
         * Merchant client key
         */
        client_key: '',

        /**
         * papi-js version library
         */
        version: '2.0.0-SNAPSHOT',

        /**
         * Callback function that invoked by token response
         * @param {object} response
         */
        c: function (response) {
            // add some response handler here if needed
            vtCallback(appendRedirectUrl(response));
        },

        /**
         * Send token request (normal / 3D secure) to url endpoint
         * @param {function} tokenRequest
         * @param {function} callback
         */
        token: function (tokenRequest, callback) {
            if (processToken(tokenRequest, callback, false)) {
                // processJsonP invoked if processToken return true
                processJsonP(Veritrans.url + toQueryParam(vtRequest));
            }
        },

        /**
         * Send token cvv request (for two_click) to url endpoint
         * @param {function} tokenRequest
         * @param {function} callback
         */
        tokenCvv: function (tokenRequest, callback) {
            if (processToken(tokenRequest, callback, true)) {
                // processJsonP invoked if processToken return true
                processJsonP(Veritrans.url + toQueryParam(vtRequest));
            }
        }
    }
}());