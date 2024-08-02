import logging

from django.conf import settings
from django.shortcuts import redirect
from django.views.generic import ListView, TemplateView

from .services.cat_api import get_cat

logger = logging.getLogger(__name__)


class HomePage(TemplateView):
    """Home page"""
    template_name = "mainapp/index.html"
