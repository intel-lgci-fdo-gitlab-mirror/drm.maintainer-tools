# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'DRM Maintainer Tools'
copyright = '2012-2024, Intel Corporation'
author = 'Jani Nikula, Simona Vetter, and others'
release = '1.0'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'sphinxcontrib.plantuml',
    'sphinx.ext.graphviz',
    'sphinx_reredirects',
]

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

# -- Options for sphinx-reredirects ------------------------------------------
# https://documatt.com/sphinx-reredirects/usage.html

redirects = {
    'commit-access': 'committer/commit-access.html',
    'committer-drm-intel': 'committer/committer-drm-intel.html',
    'committer-drm-misc': 'committer/committer-drm-misc.html',
    'committer-guidelines': 'committer/index.html',
    'drm-intel': 'repositories/drm-intel.html',
    'drm-misc': 'repositories/drm-misc.html',
    'drm-rust': 'repositories/drm-rust.html',
    'drm-tip': 'repositories/drm-tip.html',
    'drm-xe': 'repositories/drm-xe.html',
    'drm': 'repositories/drm.html',
    'getting-started': 'committer/getting-started.html',
    'maintainer-drm-intel': 'maintainer/maintainer-drm-intel.html',
    'maintainer-drm-misc': 'maintainer/maintainer-drm-misc.html',
    'maintainer-drm-xe': 'maintainer/maintainer-drm-xe.html',
    'maintainer-guidelines': 'maintainer/index.html',
}
