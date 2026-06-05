# One Page Studio - AI-Powered Resume Builder

A beautiful, feature-rich resume builder with AI-powered optimization tools and wordsmith capabilities.

## Features

### 📝 Resume Editor
- Real-time editing with live preview
- Multiple sections: Personal Info, Experience, Skills, Education
- Clean, intuitive interface
- Auto-save to browser storage

### ✨ AI Optimizer
- **Content Enhancement**: Improve phrasing with stronger action verbs
- **ATS Optimization**: Ensure compatibility with Applicant Tracking Systems
- **Skill Recommendations**: AI-powered suggestions based on your experience
- **Resume Analysis**: Comprehensive metrics and scoring

### 📤 Export Options
- **PDF Download**: Professional PDF format
- **JSON Export**: Backup and integration support
- **Local Save**: Browser-based draft saving

### 🎨 Design
- Black Glass + Cyan theme (consistent with The Ultimate Journey ecosystem)
- Responsive design for all devices
- Professional typography and spacing
- Smooth animations and transitions

## Getting Started

### Local Development
```bash
# Open in browser
open index.html

# Or serve with a local server
python -m http.server 8000
# Visit http://localhost:8000
```

### Deployment
This is a static HTML/CSS/JavaScript application. Deploy to:
- **Netlify**: Drag and drop the folder
- **Vercel**: Connect your Git repository
- **GitHub Pages**: Push to a `gh-pages` branch
- **Manus**: Deploy directly from the dashboard

## File Structure
```
one-page-studio/
├── index.html          # Main application
├── README.md           # This file
└── .gitignore          # Git ignore rules
```

## Technology Stack
- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Styling**: Tailwind CSS (via CDN)
- **PDF Export**: html2pdf.js
- **Storage**: Browser localStorage

## Features Coming Soon
- Cloud sync with user accounts
- Multiple resume templates
- Collaborative editing
- Interview preparation tools
- Job matching integration
- LinkedIn import/export

## Customization

### Theme Colors
Edit the CSS variables in the `<style>` section:
- Cyan: `#00d9ff`
- Background: `#0f172a`
- Text: `#e0e7ff`

### Resume Preview
Modify the `resume-preview` CSS class to change the exported resume styling.

## Browser Support
- Chrome/Edge: ✅ Full support
- Firefox: ✅ Full support
- Safari: ✅ Full support
- Mobile browsers: ✅ Full support

## License
Part of The Ultimate Journey ecosystem.

## Support
For issues or feature requests, contact support@theultimatejourney.com
