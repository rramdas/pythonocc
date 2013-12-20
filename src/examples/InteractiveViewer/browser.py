# -*- coding: utf-8 -*-

## (c) Copyright 2007 Andrew Haywood
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

'''Web browser window'''

__author__ = "Andrew Haywood"
__date__ = "23 May 2008"

# --------------------------------------------------
import wx
import os
import sys
if sys.platform == 'win32':
    import wx.lib.iewin as iewin
import wx.html as html
import os.path
import sys
# --------------------------------------------------
try:
    THISPATH = os.path.dirname(os.path.abspath(__file__))
    IS_EXE = False
except:
    THISPATH = os.path.dirname(os.path.abspath(sys.argv[0]))
    IS_EXE = True
if THISPATH.endswith("zip"):
    THISPATH = os.path.dirname(THISPATH)
    IS_EXE = True


def CreateMaskedBitmap(fname, h=16, w=16):
    '''Ceate a masked bitmap where the mask colour is pink.'''
    try:
        img = wx.Bitmap(fname)
        img.SetHeight(h)
        img.SetWidth(w)
        img_mask = wx.Mask(img, wx.Colour(255, 0, 255))
        img.SetMask(img_mask)
        return img
    except:
        return None

if sys.platform == 'win32':
    class ie_HtmlWindow(iewin.IEHtmlWindow):
        """Basic wrapper around the Internet Explorer window."""
        def __init__(self, parent):
            iewin.IEHtmlWindow.__init__(self, parent, -1, style=wx.NO_FULL_REPAINT_ON_RESIZE)


class wx_HtmlWindow(html.HtmlWindow):
    """Basic wrapper around the wx HTML window."""
    def __init__(self, parent):
        html.HtmlWindow.__init__(self, parent, -1, style=wx.NO_FULL_REPAINT_ON_RESIZE)

    def Navigate(self, url):
        self.LoadPage(url)


class Browser(wx.Panel):
    """Panel containing a web browser with home, forward and back buttons."""
    def __init__(self, parent, docpath):
        wx.Panel.__init__(self, parent, -1, style=wx.NO_FULL_REPAINT_ON_RESIZE | wx.SIMPLE_BORDER)
        self.docpath = docpath
        # The buttons to navigate the HTML help page
        home_img = CreateMaskedBitmap(os.path.join(THISPATH, "icons", 'home_16.bmp'))
        back_img = CreateMaskedBitmap(os.path.join(THISPATH, "icons", 'arrow-back_16.bmp'))
        fwd_img = CreateMaskedBitmap(os.path.join(THISPATH, "icons", 'arrow-forward_16.bmp'))
        back_img_inactive = CreateMaskedBitmap(os.path.join(THISPATH, "icons", 'arrow-back_16_inactive.bmp'))
        fwd_img_inactive = CreateMaskedBitmap(os.path.join(THISPATH, "icons", 'arrow-forward_16_inactive.bmp'))
        home_btn = wx.BitmapButton(self, -1, home_img, style=wx.NO_BORDER)
        self.Bind(wx.EVT_BUTTON, self.OnHome, home_btn)

        self.back_btn = wx.BitmapButton(self, -1, back_img, style=wx.NO_BORDER)
        self.Bind(wx.EVT_BUTTON, self.OnBack, self.back_btn)
        self.forward_btn = wx.BitmapButton(self, -1, fwd_img, style=wx.NO_BORDER)
        self.Bind(wx.EVT_BUTTON, self.OnForward, self.forward_btn)

        self.back_btn.SetBitmapDisabled(back_img_inactive)
        self.forward_btn.SetBitmapDisabled(fwd_img_inactive)

        # Add an HTML control which points to the documentation to the notebook
        try:
            if sys.platform == 'win32':
                self.htmlHelp = ie_HtmlWindow(self)
            else:
                self.htmlHelp = wx_HtmlWindow(self)
        except:
            self.htmlHelp = wx_HtmlWindow(self)
        self.htmlHelp.Navigate(self.docpath)

        # Set up the sizers for the HTML help view
        ButtonSizer = wx.BoxSizer(wx.HORIZONTAL)
        ButtonSizer.Add(home_btn, 0, wx.EXPAND | wx.ALL, 2)
        ButtonSizer.Add(self.back_btn, 0, wx.EXPAND | wx.ALL, 2)
        ButtonSizer.Add(self.forward_btn, 0, wx.EXPAND | wx.ALL, 2)

        finalpanelsizer = wx.BoxSizer(wx.VERTICAL)
        finalpanelsizer.Add(ButtonSizer, 0, wx.ALIGN_LEFT)
        finalpanelsizer.Add(self.htmlHelp, 1, wx.GROW)

        self.SetSizer(finalpanelsizer)
        self.SetAutoLayout(True)

        self.forwardcount = 0
        self.backwardcount = 0
        self.SetButtonState()

        self.SetBackgroundStyle(wx.BG_STYLE_COLOUR)
        self.SetBackgroundColour(wx.WHITE)
        self.Refresh()

    def OnHome(self, event):
        self.htmlHelp.Navigate(self.docpath)
        self.SetButtonState()

    def OnBack(self, event):
        self.htmlHelp.GoBack()
        self.SetButtonState()

    def OnForward(self, event):
        self.htmlHelp.GoForward()
        self.SetButtonState()

    def SetButtonState(self):
        self.forward_btn.Enable(True)
        self.back_btn.Enable(True)

    def Navigate2(self, url):
        try:
            self.htmlHelp.Navigate2(url)
        except:
            print "Could not navigate to %s" % url


if __name__ == '__main__':
    # For testing purposes only
    class MyFrame(wx.Frame):
        def __init__(self, parent, title):
            wx.Frame.__init__(self, parent, -1, title,
                              pos=(150, 150), size=(350, 200))

    class MyApp(wx.App):
        def OnInit(self):
            frame = MyFrame(None, os.path.basename(__file__))
            self.SetTopWindow(frame)
            frame.Show(True)
            return True
    app = MyApp(redirect=False)
    app.MainLoop()
