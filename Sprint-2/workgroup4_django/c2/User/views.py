import http
from http.client import HTTPResponse


# Create your views here.
def index(response):
    return HTTPResponse('hello database')