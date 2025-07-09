import argparse

def hex_to_byte_string(hex_str):
    # Validate that the input is a valid hex string with even length
    if not all(c in '0123456789abcdefABCDEF' for c in hex_str) or len(hex_str) % 2 != 0:
        raise ValueError("Invalid hex string: must contain only hex digits and have even length")
    
    # Split into pairs of two characters and format as \xHH
    byte_pairs = [hex_str[i:i+2] for i in range(0, len(hex_str), 2)]
    byte_string = ''.join(f'\\x{pair}' for pair in byte_pairs)
    
    return f'"{byte_string}"'

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description="Convert a hexadecimal string to a Python byte string format.")
    parser.add_argument(
        "hex_string",
        type=str,
        help="The hexadecimal string to convert (e.g., 4831db536a0a...)"
    )
    
    # Parse arguments
    args = parser.parse_args()
    
    # Convert and print the result
    try:
        result = hex_to_byte_string(args.hex_string)
        print(result)
    except ValueError as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
