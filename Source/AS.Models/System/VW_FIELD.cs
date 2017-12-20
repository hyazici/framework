namespace AS.Models
{
    public class VW_FIELD
    {
        public string TableName { get; set; }
        public int TabIndex { get; set; }
        public string ColumnName { get; set; }
        public string ColumnLabel { get; set; }
        public string ColumnType { get; set; }
        public string FieldType { get; set; }
        public string Placeholder { get; set; }
        public int MinValue { get; set; }
        public int MaxValue { get; set; }
        public int MaxLenght { get; set; }
        public bool IsNullable { get; set; }
        public bool IsIdentity { get; set; }
        public bool IsComputed { get; set; }
    }
}