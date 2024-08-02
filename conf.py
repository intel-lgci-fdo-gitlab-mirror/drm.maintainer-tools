# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'DRM Maintainer Tools'
copyright = '2012-2024, Intel Corporation'
author = 'Jani Nikula, Daniel Vetter, and others'
release = '1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = []

templates_path = ['_templates']
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'README.rst', '.*']

root_doc = 'index'


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'

# Theme options are theme-specific and customize the look and feel of a theme
# further.
#
# https://alabaster.readthedocs.io/en/latest/customization.html
html_theme_options = {
    'description': 'Tool and Workflow Documentation',
    'extra_nav_links': {
        'Project Home Page': 'https://gitlab.freedesktop.org/drm/maintainer-tools',
    }
}
