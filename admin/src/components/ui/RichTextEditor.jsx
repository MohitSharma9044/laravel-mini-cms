import { CKEditor } from "@ckeditor/ckeditor5-react";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";

export default function RichTextEditor({ value, onChange }) {
  return (
    <div className="border rounded-lg overflow-hidden">
      <CKEditor
        editor={ClassicEditor}
        data={value || ""}
        onReady={(editor) => {
          console.log("Editor is ready to use!", editor);
        }}
        onChange={(event, editor) => {
          const data = editor.getData();
          onChange(data);
        }}
      />
    </div>
  );
}
