import requests

def getrequestdata():
    respones = requests.get('https://shopee.tw/api/v4/search/trending_search?bundle=popsearch&offset=0',verify=False )
    obj=respones.json()
#   print(type(obj)) #dict
#   print(type(obj['data'])) #'dict'
    dric=(obj['data'])
#   print(type(dric['querys']))#'list''
    print(dric['querys'])
#   print(type(dric['querys'][0])) #'dict'
