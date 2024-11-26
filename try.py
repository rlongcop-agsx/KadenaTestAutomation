from SikuliLibrary import SikuliLibrary

try:
    sikuli_lib = SikuliLibrary(port=5000)
    print("Connection to Sikuli Java process successful!")
    print(sikuli_lib.get_keyword_names())  # This should print available keywords
except Exception as e:
    print(f"Failed to connect to Sikuli Java process: {e}")
