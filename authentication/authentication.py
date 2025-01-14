from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed

class NoAuthentication(BaseAuthentication):
    def authenticate(self, request):
        # Allow any request without authenticating (effectively disables auth for the view)
        return None
