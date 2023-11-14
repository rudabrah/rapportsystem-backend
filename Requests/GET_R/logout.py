from flask_restx import Resource
from flask import jsonify
#imports os
import os
current_directory = os.getcwd()
#imports sys
import sys
sys.path.append(os.path.join(current_directory))
from flask import session
from USER_session import sessionhandler as SH
from Common.Requirements.session_req import require_session

#Get request for logout
def logout_route(ns):
    @ns.route('/logout')
    class logout(Resource):
        @ns.doc('Logout',
                description='Logout route, logs user out and returns a goodbye message, with Logout: True/False',
                responses={200: 'OK', 
                           400: 'Invalid Argument', 
                           500: 'Mapping Key Error'})
        @require_session
        def get(self):
            user_session = SH.UserSession(session)
            return {"Goodbye": "See you again soon!","Logout": user_session.logout()},200
        
