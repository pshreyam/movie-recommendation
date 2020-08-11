def isEmpty(*args):
    for arg in args:
        if arg.strip() == "":
            return True
