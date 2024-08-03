import logging

from django.views.generic import TemplateView

logger = logging.getLogger(__name__)


class HomePage(TemplateView):
    """Home page"""
    template_name = "mainapp/index.html"
