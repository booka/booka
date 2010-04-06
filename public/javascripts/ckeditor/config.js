/*
Copyright (c) 2003-2009, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
    config.toolbar = 'BookaToolbar';

    config.toolbar_BookaToolbar =
    [
    ['Cut','Copy','Paste','PasteText','PasteFromWord'],
    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    '/',
    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],'/',
    ['Smiley', 'Link','Unlink','Table', 'HorizontalRule'],
    ['Format','Font','FontSize'],
    '/',
    ['TextColor','BGColor'],
    ['Maximize','-', 'Source']
    ];
};
