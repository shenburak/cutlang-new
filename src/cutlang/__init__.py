from .CLA import interpreter as CutLang

import argparse

def main():
    """Entry point for the application script"""
    # Instantiate the parser
    parser = argparse.ArgumentParser(description='Optional app description')
    # Required positional argument
    parser.add_argument('file', type=str,
                        help='A required file positional argument')

    # Optional positional argument
    #parser.add_argument('file_type', type=str, nargs='?',
    #                    help='An optional filetype positional argument')

    # Optional arguments
    parser.add_argument('adl', type=str, nargs='?',
                        help='An optional inifile argument')
    parser.add_argument('-e', type=int,
                        help='An optional inifile argument')
    parser.add_argument('-s', type=int,
                        help='An optional inifile argument')
    parser.add_argument('-v', type=int,
                        help='An optional inifile argument')

    # Switch
    parser.add_argument('-p', action='store_true',
                        help='A boolean switch')

    args = parser.parse_args()
    CutLang(args.file, args.adl, True, args.e, args.s, args.v, args.p)

if __name__ == "__main__":
    exit(main())