import json
from gateway.cors import CorsHttpRequestHandler
from nameko.rpc import RpcProxy
from werkzeug import Response


class GatewayService:
    name = "gateway"

    math_rpc = RpcProxy("mathserv")
    http = CorsHttpRequestHandler.decorator

    @http("GET", "/math/square/<int:n>")
    def get_square(self, _request, n: int):
        square = self.math_rpc.get_square(n)
        r = json.dumps({"data": square})
        return Response(r, mimetype="application/json")
