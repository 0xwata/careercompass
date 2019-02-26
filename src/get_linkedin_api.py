# -*- coding: utf-8 -*-
from linkedin_v2 import linkedin
from requests_oauthlib import OAuth2Session
from requests_oauthlib.compliance_fixes import linkedin_compliance_fix
import xmltodict
import json
import webbrowser


def main():

     #__init__
    client_id  = '81jfp87tuel89d'
    client_secret = 'FANBGNhDSJbaMmV1'
    return_url = 'https://localhost:8888'
    authorization_base_url = 'https://www.linkedin.com/uas/oauth2/authorization'
    token_url = 'https://www.linkedin.com/uas/oauth2/accessToken'

    #
    linkedin_oauth2 = OAuth2Session(client_id, redirect_uri=return_url)
    linkedin_oauth2 = linkedin_compliance_fix(linkedin_oauth2)
    authorization_url, state = linkedin_oauth2.authorization_url(authorization_base_url)
    print('Please go here and authorize:\n{}'.format(authorization_url))
    webbrowser.open(authorization_url)
    redirect_response = input('Paste the full redirect URL here:')
    linkedin_oauth2.fetch_token(token_url, client_secret=client_secret,
                      authorization_response=redirect_response)
    r = linkedin_oauth2.get('https://api.linkedin.com/v1/people/~')

    #__API叩いた結果を表示__
    result = xmltodict.parse(r.content.decode('utf-8'))
    result = json.dumps(result, indent=2)
    print(result.encode().decode('unicode-escape'))




if __name__ == '__main__':
    main()
