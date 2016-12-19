//
//  Handlers.swift
//  Perfect-Session-Memory-Demo
//
//  Created by Jonathan Guthrie on 2016-12-15.
//
//


import PerfectLib
import PerfectHTTP
import PerfectMustache
import PerfectSession
import TurnstileCrypto

public class WebHandlers {
	/* =================================================================================================================
	Index
	================================================================================================================= */
	open static func indexHandlerGet(request: HTTPRequest, _ response: HTTPResponse) {

		let rand = URandom()

		request.session.data[rand.secureToken] = rand.secureToken

		let dump = try? request.session.data.jsonEncodedString()

		let context: [String : Any] = [
			"x": "y",
			"sessionid": request.session.token,
			"dump": dump ?? ""
		]
		response.render(template: "/views/index", context: context)

	}
	/* =================================================================================================================
	/Index
	================================================================================================================= */

}
