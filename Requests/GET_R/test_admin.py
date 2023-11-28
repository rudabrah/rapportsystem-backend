#import flask_restx
from flask_restx import Resource
#imports os
import os
current_directory = os.getcwd()
#imports sys - for pathing to files
import sys
sys.path.append(os.path.join(current_directory))

#imports requirements
from Common.Requirements.admin_req import require_admin_account
from Common.Requirements import valid_token as vt
from flask_jwt_extended import jwt_required

#creates test route for admin account
def test_admin_route(ns):
    @ns.route('/test_admin')
    class Test(Resource):
        @ns.doc('test_admin',
                description='Test route, returns OK if the API is running and the user is logged in as Admin.',
                responses={200: 'OK', 
                           400: 'Invalid Argument', 
                           500: 'Mapping Key Error'})

        #requirement for admin account & requires valid jwt token
        @jwt_required()
        @vt.require_valid_token
        @require_admin_account
        
        def get(self):
            return {"Test": "OK"},200