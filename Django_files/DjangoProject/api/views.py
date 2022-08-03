from rest_framework.decorators import api_view
from rest_framework.response import Response

@api_view(['GET'])
def getRoutes(request):
    routes = [ 
        {
            'Endpoint':'/DjangoProject/',
            'method':'GET',
            'body': None,
            'description' : 'none'
        },
        {
            'Endpoint':'/DjangoProject/id',
            'method':'GET',
            'body': None,
            'description' : 'none'
        },
        {
            'Endpoint':'/DjangoProject/create/',
            'method':'POST',
            'body': {'body':""},
            'description' : 'none'
        },
        {
            'Endpoint':'/DjangoProject/id/update/',
            'method':'PUT',
            'body': {'body':""},
            'description' : 'none'
        },
        {
            'Endpoint':'/DjangoProject/id/delete/',
            'method':'DELETE',
            'body': None,
            'description' : 'none'
        }
    ]
    return Response(routes)
