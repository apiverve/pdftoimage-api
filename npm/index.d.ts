declare module '@apiverve/pdftoimage' {
  export interface pdftoimageOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface pdftoimageResponse {
    status: string;
    error: string | null;
    data: PDFtoImageData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface PDFtoImageData {
      pageCount:  number | null;
      format:     null | string;
      dpi:        number | null;
      imageCount: number | null;
      expires:    number | null;
      images:     Image[];
  }
  
  interface Image {
      page:        number | null;
      imageName:   null | string;
      width:       number | null;
      height:      number | null;
      dpi:         number | null;
      size:        number | null;
      downloadURL: null | string;
  }

  export default class pdftoimageWrapper {
    constructor(options: pdftoimageOptions);

    execute(callback: (error: any, data: pdftoimageResponse | null) => void): Promise<pdftoimageResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: pdftoimageResponse | null) => void): Promise<pdftoimageResponse>;
    execute(query?: Record<string, any>): Promise<pdftoimageResponse>;
  }
}
