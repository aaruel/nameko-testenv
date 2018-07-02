from nameko.rpc import rpc


class MathService:
    name = "mathserv"

    @rpc
    def get_square(self, n: float):
        return n * n
