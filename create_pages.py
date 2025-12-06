import os
import sys
import subprocess

def create_page(page_name, content):
    """
    Create a new HTML page with clean URLs (no .html extension)
    
    Usage: python create_page.py horse "horse"
    This creates xyz.com/horse (not xyz.com/horse.html)
    """
    
    # Create simple HTML
    html_content = f"""<!DOCTYPE html>
<html>
<head>
    <title>{content}</title>
    <style>
        body {{
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }}
        h1 {{
            font-size: 4rem;
        }}
    </style>
</head>
<body>
    <h1>{content}</h1>
</body>
</html>
"""
    
    # Create directory structure for clean URLs
    # horse.html becomes horse/index.html
    # This makes it accessible at xyz.com/horse instead of xyz.com/horse.html
    
    directory = page_name
    if not os.path.exists(directory):
        os.makedirs(directory)
    
    filepath = os.path.join(directory, 'index.html')
    
    # Write the HTML file
    with open(filepath, 'w') as f:
        f.write(html_content)
    
    print(f"✓ Created {filepath}")
    
    # Git commands to publish
    try:
        subprocess.run(['git', 'add', directory], check=True)
        subprocess.run(['git', 'commit', '-m', f'Add {page_name} page'], check=True)
        subprocess.run(['git', 'push'], check=True)
        print(f"✓ Published to GitHub!")
        print(f"✓ Page will be available at: https://YOUR-USERNAME.github.io/my-website/{page_name}")
    except subprocess.CalledProcessError as e:
        print(f"✗ Error publishing: {e}")
        return False
    
    return True

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python create_page.py <page_name> <content>")
        print("Example: python create_page.py horse 'horse'")
        sys.exit(1)
    
    page_name = sys.argv[1]
    content = sys.argv[2]
    
    create_page(page_name, content)