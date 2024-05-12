"""Contains string utility functions"""


def is_empty(*args):
    """Return true if any field is not empty"""
    for arg in args:
        if arg.strip() == "":
            return True
    return False
