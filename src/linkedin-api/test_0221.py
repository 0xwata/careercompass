# -*- coding: utf-8 -*-
from linkedin_v2 import linkedin
from requests_oauthlib import OAuth2Session
from requests_oauthlib.compliance_fixes import linkedin_compliance_fix
import xmltodict
import json
import webbrowser
import re


def main():

     #__init__
    client_id  = '81jfp87tuel89d'
    client_secret = 'FANBGNhDSJbaMmV1'
    return_url = 'https://localhost:8888'
    authorization_base_url = 'https://www.linkedin.com/uas/oauth2/authorization'
    token_url = 'https://www.linkedin.com/uas/oauth2/accessToken'


    linkedin_oauth2 = OAuth2Session(client_id, redirect_uri=return_url)
    linkedin_oauth2 = linkedin_compliance_fix(linkedin_oauth2)
    authorization_url, state = linkedin_oauth2.authorization_url(authorization_base_url)
    print('Please go here and authorize:\n{}'.format(authorization_url))
    webbrowser.open(authorization_url)
    redirect_response = input('Paste the full redirect URL here:')
    match_obj = redirect_response.split('code=')[1].split('&state')[0]
    print()
    print(match_obj)
    authentication.authorization_code = match_obj
    authentication.get_access_token()



    # application = linkedin.LinkedInApplication(authentication)
    # application.get_profile()



if __name__ == '__main__':
    main()
