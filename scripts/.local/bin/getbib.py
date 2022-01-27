#!/usr/bin/env python3

import re

import PyPDF2
import habanero

def fixdoi(doi):
    doi = re.sub(r'^10', 'doi:10', doi)
    doi = re.sub(r'^DOI', 'doi', doi)
    doi = re.sub(r'^doi/', 'doi:', doi)
    doi = re.sub(r' ', '', doi)
    return doi

def get_doi(fd):
    doi_regex = re.compile(r'10.\d{4,9}/[-._;()/:A-Z0-9]+', flags=re.IGNORECASE)
    # https://www.crossref.org/blog/dois-and-matching-regular-expressions/


